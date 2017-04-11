class RemoveUserTypeFromUsersAndAddUserAddress < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :user_type
  	add_column :users, :address, :string
  end
end
