class Salesforce::AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

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

  def new
  end

  def create
    @salesforce_response = SalesForce::Accounts::Creation.new(session, account_params).perform

    respond_to do |format|
      format.js
    end
  end

  private

  def account_params
    params.permit(:Name, :Phone, :BillingStreet, :BillingCity, :BillingState, :BillingCountry, :BillingPostalCode)
  end

end
