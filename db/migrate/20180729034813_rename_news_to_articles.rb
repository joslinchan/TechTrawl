class RenameNewsToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_table :news, :articles
  end
end
