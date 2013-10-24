Rails Notifier
==============

A simple library to send notifications from your Rails application.

Add to your Gemfile:

	gem 'rails_notifier', github: 'gerryeng/rails_notifier'


Set the email address where notifications will be sent to. Place it in an initializer

	# config/intializers/notifier.rb
	Notifier::Configuration.setup do |config|
		config.admin_email = 'your_email_address@gmail.com'
	end

