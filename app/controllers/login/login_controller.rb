module Login
  class LoginController < ApplicationController
    skip_before_action :authenticate_user!
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        data = { name: @user.name, email: @user.email }
        render json: { user: data, token: token }
      else
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end
    end
  end
end
