class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :company

  validates :company_id, uniqueness: { scope: :tag_id }
end
