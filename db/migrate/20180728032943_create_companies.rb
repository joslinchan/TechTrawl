class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.text :overview
      t.integer :employees
      t.integer :tech_team
      t.string :website
      t.string :tags
      t.string :twitter
      t.string :logo
      t.boolean :published
      t.string :owner_id

      t.timestamps
    end
  end
end
