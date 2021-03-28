class Api::V1::ReservationsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @emails = Email.all
  end

  def show
  end

  def confirm
    puts "******"
    puts webhook_key
    create_confirmation if request.headers['X-Parse-Webhook-Key'] == webhook_key
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
        type: type
      )
    end
  end
end


# Parse.Cloud.afterSave("reservation", (request) => {
#   const query = new Parse.Query("Post");
#   query.get(request.object.get("post").id)
#     .then(function(post) {
#       post.increment("comments");
#       return post.save();
#     })
#     .catch(function(error) {
#       console.error("Got an error " + error.code + " : " + error.message);
#     });
# });