class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation
                  :full_name, :location, :website, :github
  has_secure_password
end
