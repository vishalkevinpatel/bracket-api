class AddMatrixToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :matrix, :integer
  end
end
