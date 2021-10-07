Rails.application.configure do
  config.oauth_salesforce_instance = Rails.application.credentials.oauth_salesforce_instance
  config.salesforce_instance = Rails.application.credentials.salesforce_instance
  config.salesforce_data_version = Rails.application.credentials.salesforce_data_version
  config.salesforce_pre_url_api = "https://#{Rails.application.credentials.salesforce_instance}.salesforce.com/services/data/#{Rails.application.credentials.salesforce_data_version}/"
end
