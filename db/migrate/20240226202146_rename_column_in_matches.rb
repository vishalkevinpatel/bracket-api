class RenameColumnInMatches < ActiveRecord::Migration[7.0]
  def change
    rename_column :matches, :winner_team_id_id, :winner_team_id
  end
end
