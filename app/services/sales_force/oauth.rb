require "uri"
require "net/http"

module SalesForce
  class Oauth
    def perform
      uri = URI.parse("https://#{Rails.application.credentials.oauth_salesforce_instance}.salesforce.com/services/oauth2/token")
      request = Net::HTTP::Post.new(uri)
      request.set_form_data(sales_force_params)
      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      JSON.parse response.body
    end

    private

    def sales_force_params
      password = Rails.application.credentials.dig(Rails.env.to_sym.to_sym, :sales_force, :password) +
        Rails.application.credentials.dig(Rails.env.to_sym.to_sym, :sales_force, :security_token)

      {
        client_id: Rails.application.credentials.dig(Rails.env.to_sym.to_sym, :sales_force, :consumer_key),
        client_secret: Rails.application.credentials.dig(Rails.env.to_sym.to_sym, :sales_force, :consumer_secret),
        grant_type: "password",
        password: password,
        username: Rails.application.credentials.dig(Rails.env.to_sym.to_sym, :sales_force, :username)
      }
    end
  end
end
