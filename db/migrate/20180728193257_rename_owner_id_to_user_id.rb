class RenameOwnerIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :companies, :owner_id, :user_id
  end
end
