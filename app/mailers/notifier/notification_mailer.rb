class Notifier::NotificationMailer < ActionMailer::Base
	def notification(email_address, message, subject="")
		@message = message
		from = Notifier::Configuration.from_address
		mail from: from, to: email_address, subject: subject
	end
end