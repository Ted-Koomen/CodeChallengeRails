class JobsController < ApplicationController

  def index
    render json:Job.all
  end

  def create
    job = Job.new
    job.title = params[:job][:title]
    job.description = params[:job][:description]
    job.date_completed = params[:date]
    job.urgent = params[:job][:urgent]
    if job.save
      render json: job
    else
      render json: job.errors.full_messages, status: 400
    end
  end

  def update
    job = Job.find(params[:id].to_i)
    if job.update(title: params[:title], description: params[:description], date_completed: params[:date_completed], urgent: params[:urgent])
      render json: "Successfully Updated!"
    else
      render json: "Errors"
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
    params.require(:job).permit( :title, :description, :date, :urgent)
  end

end
