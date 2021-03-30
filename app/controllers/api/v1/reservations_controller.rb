class Api::V1::ReservationsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @emails = Email.all
  end

  def show
  end

  def confirm
    email = create_confirmation if request.headers['X-Parse-Webhook-Key'] == webhook_key
    NotificationMailer.reservation_confirmed(email).deliver_now
    NotificationMailer.confirmation_to_venue(email).deliver_now
    # render json: "reservation received"
  end

  private

  def webhook_key
    @webhook_key = ENV['PARSE_WEBHOOK_KEY']
  end

  def create_confirmation
    reservation = params["object"]
    type =  params["block"] ? "venue_blocked" : "customer"
    if params["triggerName"] == "afterSave" && reservation["className"] == "reservation"
      Email.create(
        recipient_email: reservation["email"], 
        recipient_phone: reservation["number"],
        start_time: reservation["start"], 
        end_time: reservation["end"],
        venue_id: reservation["venue_id"],
        name: reservation["name"],
        object_id: reservation["objectId"],
        reservation_type: type
      )
    end
  end
end