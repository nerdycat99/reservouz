class AddVenueIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :venue_id, :string
  end
end
