class Event < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :meetup_id, uniqueness: true

  def self.search(term)
    @companies = 
    if term 
        where("name ILIKE ?", "%#{term}%").order("name ASC")
    else 
        order("name ASC")
    end
end

end
