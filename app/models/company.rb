class Company < ApplicationRecord
    belongs_to :user
    has_one :users, dependent: :nullify
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    has_many :events, dependent: :destroy

    validates(:name, presence: true, uniqueness: true)

    def self.search(term)
        if term 
            where("name ILIKE ?", "%#{term}%").order("name ASC")
        else 
            order("name ASC")
        end
    end
end
