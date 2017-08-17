class Job < ApplicationRecord
  validates :title, :description, :date_completed, presence: true
end
