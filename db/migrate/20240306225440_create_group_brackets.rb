class CreateGroupBrackets < ActiveRecord::Migration[7.0]
  def change
    create_table :group_brackets do |t|

      t.timestamps
    end
  end
end
