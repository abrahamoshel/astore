class ShiftMailer < ActionMailer::Base
default :from => EMAILFROM

    def shift_taken(shift)
      @shift = shift
      @url = "http://www.apple.com"
      headers "Reply-to" => REPLYTO
      @css = File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css')).gsub(/\/images\/([a-zA-Z\-\_]+\.jpg)/) do |match|
          attachments.inline[$1] = File.read File.join(Rails.root, 'public', 'images', $1)
          attachments.inline[$1].url
      end
        
      mail(:to => [shift.email, shift.takingEmail, EMAILTOSCHEDULETEAM],
          :subject => "A Shift was taken")
    end
end
