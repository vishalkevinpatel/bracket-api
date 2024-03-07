class Groups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
    end
  end
end
