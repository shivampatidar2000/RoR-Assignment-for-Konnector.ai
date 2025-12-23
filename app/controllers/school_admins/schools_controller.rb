module SchoolAdmins
  class SchoolsController < ApplicationController
    before_action :authorize_school_admin!

    def update
      school = current_user.schools.find(params[:id])

      if school.update(school_params)
        render json: school
      else
        render json: { errors: school.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def school_params
      params.require(:school).permit(:name, :address)
    end
  end
end
