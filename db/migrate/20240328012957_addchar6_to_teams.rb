class Addchar6ToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :char6, :string
  end
end
