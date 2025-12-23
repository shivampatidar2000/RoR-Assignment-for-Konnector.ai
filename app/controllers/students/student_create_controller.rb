module Students
  class StudentCreateController  < ApplicationController
    before_action :authorize_creator!
    def create
      student = User.new(student_params)
      student.role = "student"

      if student.save
        render json: student, status: :created
      else
        render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def authorize_creator!
      unless current_user.admin? || current_user.school_admin?
        render json: { error: "Forbidden" }, status: :forbidden
      end
    end

    def student_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
