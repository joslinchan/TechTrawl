class AddUrlnameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :urlname, :string
  end
end
