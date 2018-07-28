class Company < ApplicationRecord
    has_one :users, dependent: :nullify

    validates(:name, presence: true, uniqueness: true)
end
