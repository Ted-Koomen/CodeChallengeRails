class JobsController < ApplicationController

  def index
    render json:Job.all
  end

  def create
    job = Job.new
    job.title = params[:job][:title]
    job.description = params[:job][:description]
    if job.save
      render json: job
    else
      render "Save Unsuccessful"
    end
  end

  # def new
  #   job = Job.new
  #   job.title = params[:content]
  #   job.description = params[:description]
  #   job.importance = params[:urgent]
  #   job.date_completed = params[:date_completed]
  #   if job.save
  #     render json: job
  #   else
  #     render "Save unsucessful"
  #   end
  # end

  private

  def job_params
    params.require(:job).permit( :title, :description, :urgent, :date_completed)
  end

end
