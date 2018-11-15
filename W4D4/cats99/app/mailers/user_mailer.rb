class UserMailer < ApplicationMailer
	default from: 'from@example.com'

	def welcome_email(user)
		@user = user
		mail(to: 'everybody@appacademy.io', subject: 'Welcome to 99Cats!')
	end


end
