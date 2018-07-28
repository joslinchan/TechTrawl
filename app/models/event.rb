class Event < ApplicationRecord
  belongs_to :company

  validates :name, :start_time, :end_time, presence: true
end
