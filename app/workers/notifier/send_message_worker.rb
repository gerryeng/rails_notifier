class Notifier::SendMessageWorker
	include Sidekiq::Worker

	def perform(message, subject)
		Notifier.send_message message, subject
	end

end