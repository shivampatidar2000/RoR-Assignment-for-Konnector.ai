module Admin
  class CreateAdminController < ApplicationController
    # before_action :authorize_admin!
    skip_before_action :authenticate_user!
    def create
      admin = User.new(admin_params)
      admin.role = "admin"
      if admin.save
        @token = JsonWebToken.encode(user_id: admin.id)
        render json: { data: admin, token: @token }, status: :created
      else
        render json: { errors: admin.errors.full_message }, status: :unprocessable_entity
      end
    end

    private

    def admin_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation
      )
    end
  end
end
