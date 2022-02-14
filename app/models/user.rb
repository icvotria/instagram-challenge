class User < ApplicationRecord
  has_many :posts
  
  has_secure_password
  
  validates :username, presence: true, length: {maximum: 20}, uniqueness: { case_sensitive: true }
  validates :name, presence: true, length: {maximum: 20}
  validates :email, :email_format => { :message => 'That\'s not an email!' },
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 4, maximum: 254 }
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :password, presence: true, length: { minimum: 7, message: 'Password cannot be fewer than 7 characters!' }
end
