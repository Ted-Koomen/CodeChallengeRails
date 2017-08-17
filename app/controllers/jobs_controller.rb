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
    job.phone_number = params[:phoneNumber]

    if job.save
      render json: job
    else
      render json: job.errors.full_messages, status: 400
    end
  end

  def update
    job = Job.find(params[:id].to_i)
    if job.update_job(params)
      render :job
    else
      render "Error", status: 400
    end
  end

  def destroy
    job = Job.find(params[:id].to_i)
    job.destroy
  end


  private

  def job_params
    params.require(:job).permit( :title, :description, :date, :urgent, :phoneNumber)
  end

end
