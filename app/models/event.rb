class Event < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  # validates :meetup_id, uniqueness: true

end
