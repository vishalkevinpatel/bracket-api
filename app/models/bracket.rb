class Bracket < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :group_brackets
  has_many :groups, through: :group_brackets
end
