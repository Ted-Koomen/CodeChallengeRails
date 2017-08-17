class Job < ApplicationRecord
  validates :title, :description, :urgent, :date_completed, presence: true
end
