class RemoveUsersFromMatches < ActiveRecord::Migration[7.0]
  def change
    remove_column :matches, :user_id
  end
end
