class User < ActiveRecord::Base
  has_many :podcasts
  has_secure_password
  validates :username, :email, presence: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email
end
