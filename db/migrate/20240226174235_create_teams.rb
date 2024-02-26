class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :seed
      t.string :region
      t.integer :superseed

      t.timestamps
    end
  end
end
