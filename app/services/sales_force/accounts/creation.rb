module SalesForce
  module Accounts
    class Creation
      def initialize(user_session, account_params)
        @user_session = user_session
        @path = "sobjects/Account"
        @account_params = account_params
      end

      def perform
        ::SalesForce::ApiPost.new(@user_session, @path, @account_params).perform
      end
    end
  end
end
