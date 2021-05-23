# frozen_string_literal: true

module Parse
  class Reservation

    require 'net/http'
    require 'uri'
    require 'json'

    attr_accessor :start_date, :end_date, :number, :venue_id, :name, :email

    def initialize(params)
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @number = params[:number]
      @venue_id = params[:venue_id]
      @name = params[:name]
      @email= params[:email]
    end

    def self.search(venue_id)
      searchFilter = '{"venue_id":"' + venue_id + '"}'
      uri = URI.parse("#{ENV["PARSE_SERVER_URL"]}/classes/reservation?where=#{searchFilter}")
      request = Net::HTTP::Get.new(uri)
      request["X-Parse-Application-Id"] = ENV["PARSE_SERVER_APPLICATION_ID"]
      request["X-Parse-Rest-Api-Key"] = ENV["PARSE_SERVER_REST_API_KEY"]

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      # response = "{\"results\":[{\"objectId\":\"OD5eSbpHqD\",\"venue_id\":\"12345\",\"end\":\"2021-03-30T07:30:00.000Z\",\"email\":\"\",\"number\":\"12451\",\"start\":\"2021-03-30T07:00:00.000Z\",\"name\":\"first booking\",\"createdAt\":\"2021-03-25T15:35:08.977Z\",\"updatedAt\":\"2021-03-25T15:35:08.977Z\"},{\"objectId\":\"MDtN5ydGQO\",\"venue_id\":\"12345\",\"name\":\"second person\",\"end\":\"2021-03-30T08:30:00.000Z\",\"start\":\"2021-03-30T08:00:00.000Z\",\"createdAt\":\"2021-04-03T14:03:46.161Z\",\"updatedAt\":\"2021-04-03T14:03:48.114Z\",\"number\":\"999876\"}]}"

      collection = []

      json = JSON.parse(response.body)
      puts json.inspect
      json["results"].each do | element |
        reservation = self.new({
          start_date: element["start"], 
          end_date: element["end"], 
          number: element["number"], 
          venue_id: element["venue_id"], 
          name: element["name"],
          email: element["email"]
        })
        collection << reservation
      end
      collection
    rescue StandardError
    end

  end
end