class ChangeMeetupIdTypeInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :meetup_id, :string
  end
end
