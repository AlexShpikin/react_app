class User < ApplicationRecord
	# NOTE форматирование страдает. когда так делают - в мире грустит один rubocop
	before_save { self.login = login.downcase }
  	before_create :create_remember_token
	validates :role, presence: true
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :login, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  	has_secure_password
  	validates :password, length: { minimum: 6 }
  	def User.new_remember_token
	    SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

	private
	    def create_remember_token
	      self.remember_token = User.encrypt(User.new_remember_token)
	    end
end
