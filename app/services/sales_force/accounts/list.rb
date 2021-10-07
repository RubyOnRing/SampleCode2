module SalesForce
  module Accounts
    class List
      def initialize(user_session)
        @user_session = user_session
        @path = 'sobjects/Account'
      end

      def perform
        data = ::SalesForce::ApiGet.new(@user_session, 'sobjects/Account').perform
        data['recentItems']
      end
    end
  end
end
