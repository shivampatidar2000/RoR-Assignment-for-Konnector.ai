module SchoolAdmins
  class BatchesController < ApplicationController
    before_action :authorize_school_admin!

    def create
      batch = Batch.new(batch_params)

      if batch.save
        render json: batch, status: :created
      else
        render json: { errors: batch.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def batch_params
      params.require(:batch).permit(:name, :course_id, :start_date, :end_date)
    end
  end
end
