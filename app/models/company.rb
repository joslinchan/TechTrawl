class Company < ApplicationRecord
    has_many :users, dependent: :nullify

    validates(:name, presence: true, uniqueness: true)
end
