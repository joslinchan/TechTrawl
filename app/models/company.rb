class Company < ApplicationRecord
    belongs_to :user
    has_one :users, dependent: :nullify
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    has_many :events, dependent: :destroy

    validates(:name, presence: true, uniqueness: true)
end
