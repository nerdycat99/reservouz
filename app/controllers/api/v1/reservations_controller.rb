class Api::V1::ReservationsController < ApplicationController
  def index
    Email.create(recipient_email: "email@adress.com", recipient_phone: "12345678", start_time: "900", end_time: "930", venue_id: "44444")
    render json: "hello"
  end

  def show
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