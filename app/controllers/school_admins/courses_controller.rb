module SchoolAdmins
  class CoursesController < ApplicationController
    before_action :authorize_school_admin!

    def create
      course = Course.new(course_params)

      if course.save
        render json: course, status: :created
      else
        render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def course_params
      params.require(:course).permit(:name, :description, :school_id)
    end
  end
end