class NotificationMailer < ActionMailer::Base
  default from: "no-reply@urtakeapp.com"

  def comment_added
    mail(to: "anthonydevenuto@gmail.com",
      subject: "A comment has been added to your place")
  end
end
