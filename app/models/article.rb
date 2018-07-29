class Article < ApplicationRecord
    
    belongs_to :company

  validates(:name, presence: true)

end
