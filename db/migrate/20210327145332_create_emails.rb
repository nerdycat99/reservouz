class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.text 'recipient_email'
      t.text 'recipient_phone'
      t.text 'start_time'
      t.text 'end_time'
      t.text 'venue_id'

      t.timestamps
    end
  end
end
