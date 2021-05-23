class StaticController < ApplicationController

  before_action :registration_in_progress

  def index
    redirect_to new_reservation_path(venue: venue_external_id) if venue_external_id
  end

  def about
  end

  def apple_app_site_association
    association_json = File.read(Rails.public_path + "apple-app-site-association")
    render :json => association_json, :content_type => "application/pkcs7-mime"
  end

  def support
  end

  def privacy
  end

  private

  def registration_in_progress
    if user_signed_in?
      redirect_to new_admin_venue_path if current_user.venue_id.nil?
    end
  end

  def venue_external_id
    @venue_external_id = params["v"]
  end
end
