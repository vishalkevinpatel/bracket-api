class User < ApplicationRecord
  # need has_secure_password for bcypt to work at all
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
