class Admin::VenuesController < ApplicationController

  def show
    @venue = venue
    @reservations = Parse::Reservation.search(@venue.external_id) if @venue.present?
  end

  def new
    @timezones = timezones
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    if @venue
      @venue.generate_external_id
      user = User.find_by_id(current_user.id)
      updated_user = user.update_when_registering_venue(first_name, last_name, @venue.id)
      if updated_user
        redirect_to new_admin_policy_path(:venue_id => @venue.id)
      else
        # the user was not updated with the venue, user exists and venue exist but not linked!!
      end
    else
      # the venue was not saved and user was not updated
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  private

  def timezones
    @timezones = []
    @timezones << "select timezone"
    ActiveSupport::TimeZone.all.each do | timezone |
      @timezones << timezone.name
    end
    @timezones
  end

  def venue
    @venue ||= Venue.includes(:policy).find_by_id(params["id"])
  end

  def venue_params
    defaults = { email_address: current_user.email, external_id: "91919" }
    params.require(:venue).permit(:name, :zone, :address, :latitude, :longitude, :email_address, :external_id).reverse_merge(defaults)
  end

  def first_name
    @first_name = params["venue"]["first_name"]
  end

  def last_name
    @last_name = params["venue"]["last_name"]
  end
end
