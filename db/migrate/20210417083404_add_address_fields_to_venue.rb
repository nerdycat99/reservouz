class AddAddressFieldsToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :address, :text
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
  end
end
