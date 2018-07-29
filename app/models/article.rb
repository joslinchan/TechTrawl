class Article < ApplicationRecord
  belongs_to :company

  validates :source, presence: true
  validates :url, uniqueness: true
end
