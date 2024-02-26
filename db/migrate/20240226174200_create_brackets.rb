class CreateBrackets < ActiveRecord::Migration[7.0]
  def change
    create_table :brackets do |t|
      t.string :name
      t.integer :user_id
      t.integer :points

      t.timestamps
    end
  end
end
