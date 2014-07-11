module Notifier
	class Notifier::Notifier

		class << self

			def notify(message, subject = "")
				if config.async == true
					::Notifier::SendMessageWorker.perform_async(message, subject)
				else
					send_message(message, subject)
				end
			end

			def send_message(message, subject = "")
				via = config.notify_via.to_sym

				if via == :terminal_notifier
					notify_via_terminal_notifier(message, subject)
				elsif via == :email
					notify_via_email(message, subject)
				end
			end

			private

			def config
				::Notifier::Configuration
			end

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