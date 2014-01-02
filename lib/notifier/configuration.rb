
module Notifier

	class Configuration

		class << self

			attr_accessor :admin_email, :notify_via, :from_address, :async

			def setup

				# Defaults
				@notify_via = :terminal_notifier

			yield self
			end

		end

	end

end