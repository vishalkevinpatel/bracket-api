class Group < ApplicationRecord
  has_many :group_brackets
  has_many :brackets, through: :group_brackets
end
