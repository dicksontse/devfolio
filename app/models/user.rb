class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end
