class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_when_registering_venue(first_name, last_name, venue_id)
    puts "**** IN USER MODEL ****"
    self.first_name = first_name
    self.last_name = last_name
    self.venue_id = venue_id
    self.state = "owner"
    if self.save
      return self
    else
      return self.errors.full_messages
    end
  end

end
