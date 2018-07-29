class AddArticleToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :article, foreign_key: true
  end
end
