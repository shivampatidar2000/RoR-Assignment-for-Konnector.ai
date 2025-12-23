module Students
  class BatchesController < ApplicationController
    before_action :authorize_student!

    def classmates
      batch = Batch.find(params[:id])

      students = batch.students.select(:id, :name, :email)
      render json: students
    end
  end
end
