class AddMeetupIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :meetup_id, :integer
  end
end
