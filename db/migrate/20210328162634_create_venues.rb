class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.text 'venue_name'
      t.text 'venue_email_address'
      t.text 'external_id'
      t.timestamps
    end
  end
end
