module Notifier

	def notify(message, subject = "")
		Notifier.notify(message, subject)
	end

	module_function :notify

end