module API
  module V1
    class UserController < ApplicationController
      def create
        user = User.create(user_params)
        return head :ok
      end

      private
        def user_params
          params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end

    end
  end
end

