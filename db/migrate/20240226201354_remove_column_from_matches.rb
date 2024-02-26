class RemoveColumnFromMatches < ActiveRecord::Migration[7.0]
  def change
    remove_column :matches, :correct
  end
end
