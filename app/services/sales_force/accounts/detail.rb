module SalesForce
  module Accounts
    class Detail
      def initialize(user_session, account_id)
        @user_session = user_session
        @path = "sobjects/Account/#{account_id}"
      end

      def perform
        ::SalesForce::ApiGet.new(@user_session, @path).perform
      end
    end
  end
end
