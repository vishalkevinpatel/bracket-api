class AddColumnToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :winner_team_id, foreign_key: { to_table: :teams }
  end
end
