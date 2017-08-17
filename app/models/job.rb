class Job < ApplicationRecord
  validates :title, :description, presence: true

  def update_job(params)
    self.update(title: params[:title] || self.title)
    self.update(description: params[:description] || self.description)
    self.update(date_completed: params[:date_completed] || self.date_completed)
    self.update(urgent: params[:urgent] || self.urgent)
  end
end
