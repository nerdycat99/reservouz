class ReservationsController < ApplicationController

  require 'net/http'
  require 'uri'
  require 'json'

  def index
    # use this to enable the user to select a venue and to pass venue to new path
  end

  def new
    if venue_id.present?
      @venue = venue(venue_id)
      @reservations = Parse::Reservation.search(venue_id) if @venue.present?
    end
    redirect_to root_path, notice: "unable to find that venue" if @venue.nil? || venue_id.empty?
  end

  def create
    # we will hit this route when a user makes a reservation - this shoudl deal with the save to parse
  end

  private

  def venue(venue_id)
    @venue ||= Venue.find_by_external_id(venue_id)
  end

  def venue_id
    @venue_id = params[:venue]
  end

end
