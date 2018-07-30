class Company < ApplicationRecord
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    has_many :events, dependent: :nullify
    has_many :articles, dependent: :nullify

    geocoded_by :full_address
    after_validation :geocode, :if => :address_changed?

    validates(:name, presence: true, uniqueness: true)

    #scope :tech_team, -> (number) { where("tech_team >= 10", number }
    #the above code is Jocelyn trying to apply a search filter

    def self.search(term)
        @companies = 
        if term 
            where("name ILIKE ?", "%#{term}%").order("name ASC")
        else 
            order("name ASC")
        end
    end

    def full_address
        [address, postal_code].compact.join(', ')
    end
end
