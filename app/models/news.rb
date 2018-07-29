class News < ApplicationRecord
    
    belongs_to :company

  validates(:name, presence: true)

end
