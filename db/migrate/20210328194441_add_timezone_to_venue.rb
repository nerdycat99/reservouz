class AddTimezoneToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :zone, :text
  end
end
