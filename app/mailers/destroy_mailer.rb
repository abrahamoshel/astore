class DestroyMailer < ActionMailer::Base

  default :from => EMAILFROM

    def shift_destroy(shift)
      @shift = shift
      @url = "http://www.apple.com"
      headers "Reply-to" => REPLYTO
      attachments.inline['scheduleTeam.png'] = File.read(Rails.root.join('public/images/scheduleTeam.png'))
      @css = File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css')).gsub(/\/images\/([a-zA-Z\-\_]+\.jpg)/) do |match|
          attachments.inline[$1] = File.read File.join(Rails.root, 'public', 'images', $1)
          attachments.inline[$1].url
      end
      mail(:to => [shift.email, EMAILTOSCHEDULETEAM],
          :subject => "A Shift Deleted!")
    end
end
