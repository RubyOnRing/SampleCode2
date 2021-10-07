class Salesforce::AccountsController < ApplicationController
  def index
    if session[:salesforce_access_token].nil?
      salesforce_response = SalesForce::Oauth.new.perform
      session[:salesforce_access_token] = salesforce_response['access_token']
    end

    @accounts = SalesForce::Accounts::List.new(session).perform
    @salesforce_access_token = session[:salesforce_access_token]
  end

  def show
    @salesforce_account = SalesForce::Accounts::Detail.new(session, params[:id]).perform
  end
end
