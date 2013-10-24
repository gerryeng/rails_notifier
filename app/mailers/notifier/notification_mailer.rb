class Notifier::NotificationMailer < ActionMailer::Base
	default from: "notifications@gurusignals.com"

	def notification(email_address, subject, message)
		@message = message
		mail to: email_address, subject: subject
	end
end