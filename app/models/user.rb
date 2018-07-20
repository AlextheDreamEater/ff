class User < ApplicationRecord
  has_secure_password
  
  validates :userid, presence: true
  validates :email, presence: true
  validates :password, presence: true


 #create a session for loged in users and log out capabilities

# Need to create Admin user - and restrict areas to only Admin
end
