class Venue < ApplicationRecord
  has_many :users
  has_one :policy
  geocoded_by :address
  after_validation :geocode
  
  attr_accessor :first_name, :last_name

  def generate_external_id
    self.external_id = sprintf '%05d', self.id
    self.save
  end

end
