class AddCompanyIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :company_id, :integer, foreign_key: true
  end
end
