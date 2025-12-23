module Students
  class ProgressController < ApplicationController
    before_action :authorize_student!

    def index
      progress = Progress.where(batch_id: params[:batch_id])
      render json: progress
    end
  end
end
