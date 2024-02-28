class AddColumnsToBrackets < ActiveRecord::Migration[7.0]
  def change
    add_column :brackets, :round1, :integer
    add_column :brackets, :round2, :integer
    add_column :brackets, :round3, :integer
    add_column :brackets, :round4, :integer
    add_column :brackets, :round5, :integer
    add_column :brackets, :round6, :integer
    add_column :brackets, :round0, :integer
    rename_column :brackets, :points, :total_points
  end
end
