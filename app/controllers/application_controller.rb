class ApplicationController < ActionController::API
  before_action :authenticate_user!

  attr_reader :current_user

  private

  def authenticate_user!
    header = request.headers["token"] || request.headers["Authorization"]
    token = header.split(" ").last if header

    decoded = JsonWebToken.decode(token)
    @current_user = User.find(decoded[:user_id])
  rescue
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def authorize_admin!
    render json: { error: "Forbidden" }, status: :forbidden unless current_user.admin?
  end

  def authorize_school_admin!
    render json: { error: "Forbidden" }, status: :forbidden unless current_user.school_admin?
  end

  def authorize_student!
    render json: { error: "Forbidden" }, status: :forbidden unless current_user.student?
  end
end
