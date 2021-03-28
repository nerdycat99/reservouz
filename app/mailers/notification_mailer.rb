class NotificationMailer < ApplicationMailer

  default from: "no-reply@reservouz.com"


  def reservation_confirmed
    mail(to: "nev@drysky.co.uk",
         subject: "A comment has been added to your place")

  end

end
