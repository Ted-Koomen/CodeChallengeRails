class Job < ApplicationRecord
  validates :title, :description, presence: true

  def update_job(params)
    self.update(title: params[:title] || self.title)
    self.update(description: params[:description] || self.description)
    self.update(date_completed: params[:date_completed] || self.date_completed)
    if params[:urgent] != nil
      self.update(urgent: params[:urgent])
    else
      self.update(urgent: self.urgent)
    end
  end
end
