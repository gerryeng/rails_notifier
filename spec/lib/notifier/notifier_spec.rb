require 'spec_helper'

module Notifier
	describe Notifier do

		describe '#notify' do 
			context 'via email' do 

				before do
					Configuration.notify_via = :email
				end

				it 'should notify via email' do
					Notifier.should_receive(:notify_via_email).with('Hello World', 'Subject')
					Notifier.notify('Hello World', 'Subject')
				end

			end

			context 'via terminal notifier' do 
				before do
					Configuration.notify_via = :terminal_notifier
				end

				it 'should notify via email' do
					Notifier.should_receive(:notify_via_terminal_notifier).with('Hello World', 'Subject')
					Notifier.notify('Hello World', 'Subject')
				end
			end
		end

		describe '#notify_via_terminal_notifier' do
			it 'should send message via TerminalNotifier' do 
				TerminalNotifier.should_receive(:notify).with('Hello World')
				Notifier.send :notify_via_terminal_notifier, 'Hello World', 'Subject'
			end
		end


		describe '#notify_via_email' do
			it 'should send message via Email' do
				allow_message_expectations_on_nil
				nil.should_receive(:deliver)
				NotificationMailer.should_receive(:notification).with(nil, 'Hello World', "Subject")
				Notifier.send :notify_via_email, 'Hello World', 'Subject'
			end
		end

	end
end