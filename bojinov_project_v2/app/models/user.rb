class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_length_of :name, within: 3..20
end
