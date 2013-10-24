module Notifier
	class Notifier::Notifier

		class << self

			def notify(message, subject = "")
				via = ::Notifier::Configuration.notify_via

				if via == :terminal_notifier
					notify_via_terminal_notifier(message)
				elsif via == :email
					notify_via_email(message)
				end

			end

			private

			def notify_via_terminal_notifier(message, subject = "")
				TerminalNotifier.notify(message)	
			end

			def notify_via_email(message, subject = "")
				admin_email = ::Notifier::Configuration.admin_email
				::Notifier::NotificationMailer.notification(admin_email, message, subject).deliver
			end

		end
	end
end