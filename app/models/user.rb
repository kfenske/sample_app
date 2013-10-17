class User < ActiveRecord::Base
	has_secure_password
	before_save { email.downcase! }
#	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
#	VALID_EMAIL_REGEX = /\A[w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#	VALID_EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
end