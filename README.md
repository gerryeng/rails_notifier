Rails Notifier
==============

A simple library to send notifications from your Rails application. Currently supports sending of notifications via email and TerminalNotifier.

## Setup

Add to your Gemfile:

	gem 'notifier', github: 'gerryeng/rails_notifier'

	# OSX
	# If you want notifications to be sent using OSX User Notifications, instal this gem
	# (Useful for debugging during development)
	gem install terminal-notifier, group: :development


Set the email address where notifications will be sent to. Place it in an initializer

	# config/intializers/notifier.rb
	Notifier::Configuration.setup do |config|
		config.admin_email = 'send_notifications_here@gmail.com'
		config.from_address = 'notifications@your_app.com'

		# If you have sidekiq installed, you may send notifications asynchronously
		config.async = false


		if Rails.env == 'production'
			config.notify_via = :email
		elsif Rails.env == 'development'
			config.notify_via = :terminal_notifier
		end
	end

Send notifications from your app by calling:

	Notifier.notify('Someone registered for your application')


Make sure that ActionMailer is set up

    # config/application.rb or other environment config files
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'your_domain.com',
      user_name:            'your_user_name@your_domain.com',
      password:             'your_password',
      authentication:       'plain',
      enable_starttls_auto: true
     }


Thats all it does. A very simple library

## Future Plans

* SMS Notifications
* Message levels
* Send notifications asynchronously via Sidekiq
* More configuration options