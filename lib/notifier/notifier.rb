module Notifier
	class Notifier::Notifier

		class << self

			def notify(message)
				admin_email = ::Notifier::Configuration.admin_email
				Notifier::NotificationMailer.notification(admin_email, 'Alert', message).deliver
			end

		end
	end
end