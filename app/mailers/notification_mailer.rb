class NotificationMailer < ApplicationMailer

  default from: "no-reply@reservouz.com"


  def reservation_confirmed(email)
    # @venue = Venue.find_by_external_id(email.venue_id)
    @venue = venue(email.venue_id)
    @email = email
    @date = convert_to_short_date(@email.start_time)
    @time = convert_to_time(@email.start_time)

    mail(to: @email.recipient_email,
         subject: "Reservation made at #{@venue.name}")
  end

  def confirmation_to_venue(email)
    @customer = email.name
    @venue = venue(email.venue_id)
    @date = convert_to_short_date(email.start_time)
    @time = convert_to_time(email.start_time)

    mail(to: @venue.email_address,
         subject: "You have a reservation for #{@venue.name}")
  end

  private

  def convert_to_short_date(date_as_string)
    date_as_string.to_date.to_formatted_s(:short)
  end

  def convert_to_time(date_as_string)
    date_as_string.to_time(:utc).in_time_zone(@venue.zone).to_formatted_s(:time)
  end

  def venue(venue_id)
    Venue.find_by_external_id(venue_id)
  end


end
