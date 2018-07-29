class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :name
      t.text :description
      t.string :url_to_image
      t.datetime :published_at

      t.timestamps
    end
  end
end
