class AddForeignKeysToMatches < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :matches, :brackets, column: :bracket_id
    add_foreign_key :matches, :games, column: :game_id
  end
end
