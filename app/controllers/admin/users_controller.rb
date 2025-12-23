module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin!

    def create_school_admin
      user = User.new(school_admin_params)
      user.role = "school_admin"

      if user.save
        render json: user, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def school_admin_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
  end
end
