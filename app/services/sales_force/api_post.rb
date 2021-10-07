module SalesForce
  class ApiPost
    def initialize(user_session, api_path, api_params = {})
      @user_session = user_session
      @api_path = api_path
      @api_params = api_params
    end

    def perform
      url = URI("https://rubyonring3-dev-ed.my.salesforce.com/services/data/v52.0/#{@api_path}")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Authorization"] = "Bearer #{@user_session[:salesforce_access_token]}"
      request["Content-Type"] = "application/json"
      request.body = @api_params.to_json
      response = https.request(request)
      return response unless response.code.to_i == 401

      salesforce_response = SalesForce::Oauth.new.perform
      @user_session[:salesforce_access_token] = salesforce_response['access_token']
      request["Authorization"] = "Bearer #{@user_session[:salesforce_access_token]}"
      https.request(request)
    end
  end
end
