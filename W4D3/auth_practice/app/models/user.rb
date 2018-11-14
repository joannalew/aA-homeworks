class User < ApplicationRecord
	validates :username, :session_token, presence: true, uniqueness: true
	validates :password_digest, presence: {message: "Password can't be blank"}
	validates :password, length: {minimum: 6, allow_nil: true}
	before_validation :ensure_session_token

	attr_reader :password

	def self.find_by_credentials(uname, pword)
		user = User.find_by(username: uname)
		if user && BCrypt::Password.new(user.password_digest).is_password?(pword)
			return user
		end
		return nil
	end

	def self.generate_session_token
		return SecureRandom::urlsafe_base64(16)
	end

	def reset_session_token!
		self.session_token = User.generate_session_token
		self.save!
		return self.session_token
	end

	def ensure_session_token
		self.session_token ||= User.generate_session_token
	end

	def password=(pword)
		@password = pword
		self.password_digest = BCrypt::Password.create(pword)
	end
end
