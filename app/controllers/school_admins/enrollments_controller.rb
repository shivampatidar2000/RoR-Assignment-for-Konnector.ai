module SchoolAdmins
  class EnrollmentsController < ApplicationController
    before_action :authorize_school_admin!

    def update
      enrollment = Enrollment.find(params[:id])

      if enrollment.update(enrollment_params)
        render json: enrollment
      else
        render json: { errors: enrollment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def enrollment_params
      params.require(:enrollment).permit(:status) # approved / rejected
    end
  end
end
