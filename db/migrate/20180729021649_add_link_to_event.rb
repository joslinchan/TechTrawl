class AddLinkToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :link, :string
  end
end
