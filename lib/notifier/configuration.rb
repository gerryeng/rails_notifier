
module Notifier

	class Configuration

		class << self

			attr_accessor :admin_email

			def setup
				yield self
			end

		end

	end

end