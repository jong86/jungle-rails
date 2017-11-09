class User < ActiveRecord::Base

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

end
