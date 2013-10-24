Rails Notifier
==============

A simple library to send notifications from your Rails application. 

## Setup

Add to your Gemfile:

	gem 'rails_notifier', github: 'gerryeng/rails_notifier'


Set the email address where notifications will be sent to. Place it in an initializer

	# config/intializers/notifier.rb
	Notifier::Configuration.setup do |config|
		config.admin_email = 'your_email_address@gmail.com'
	end


Send notifications from your app by calling:

	Notifier.notify('Someone registered for your application')


Thats all it does. A very simple library

## Future Plans

* SMS Notification
* Group Notifications
* More configuration options