module Students
  class EnrollmentsController < ApplicationController
    before_action :authorize_student!

    def create
      enrollment = current_user.enrollments.new(enrollment_params)
      enrollment.status = "pending"

      if enrollment.save
        render json: enrollment, status: :created
      else
        render json: { errors: enrollment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def enrollment_params
      params.require(:enrollment).permit(:batch_id)
    end
  end
end
