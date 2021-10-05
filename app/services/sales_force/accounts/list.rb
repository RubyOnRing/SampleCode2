module SalesForce
  module Accounts
    class List
      def initialize(user_session)
        @user_session = user_session
        @path = 'sobjects/Account'
      end

      def perform
        ::SalesForce::ApiGet.new(@user_session, 'sobjects/Account').perform
      end
    end
  end
end
