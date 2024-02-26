class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :bracket_id
      t.boolean :correct
      t.integer :game_id
      t.integer :user_id
      t.references :pick_team, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
