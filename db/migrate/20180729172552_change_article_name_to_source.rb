class ChangeArticleNameToSource < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :name, :source
  end
end
