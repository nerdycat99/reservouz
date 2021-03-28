class Api::V1::ReservationsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @emails = Email.all
  end

  def show
  end

  def confirm
    puts "******"
    puts params["triggerName"].inspect
    puts params["appId"].inspect
    puts params["object"]["venue_id"].inspect
    puts params["object"]["className"].inspect
    puts request.headers['X-Parse-Webhook-Key']
    Email.create(recipient_email: "email@adress.com", recipient_phone: "12345678", start_time: "900", end_time: "930", venue_id: "44444")
    render json: "reservation received"
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