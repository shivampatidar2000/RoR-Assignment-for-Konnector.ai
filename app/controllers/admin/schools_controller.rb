module Admin
  class SchoolsController < ApplicationController
    before_action :authorize_admin!

    def create
      school = School.new(school_params)

      if school.save
        render json: school, status: :created
      else
        render json: { errors: school.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def school_params
      params.require(:school).permit(:name, :address, :school_admin_id)
    end
  end
end
