class User < ApplicationRecord
  #attr_accessible :display_name, :email, :password, :password_confirmation, :image
  has_secure_password

  before_save { self.email = email.downcase }

  validates :display_name, presence: true
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  #validates :password, presence: true, length:{ minimum:5 }
  #validates :password_confirmation, presence: true
  has_many :comment
end
