class RenameVenueFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :venues, :venue_name, :name
    rename_column :venues, :venue_email_address, :email_address
  end
end
