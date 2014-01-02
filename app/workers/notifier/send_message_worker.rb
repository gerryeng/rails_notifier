
module Notifier
	class SendMessageWorker
		include Sidekiq::Worker

		def perform(message, subject)
			Notifier.send_message message, subject
		end

	end
end