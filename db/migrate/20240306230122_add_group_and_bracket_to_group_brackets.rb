class AddGroupAndBracketToGroupBrackets < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_brackets, :group, null: false, foreign_key: true
    add_reference :group_brackets, :bracket, null: false, foreign_key: true
  end
end
