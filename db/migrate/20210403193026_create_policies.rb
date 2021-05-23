class CreatePolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.string :venue_id
      t.string :monday, array: true, default: []
      t.string :tuesday, array: true, default: []
      t.string :wednesday, array: true, default: []
      t.string :thursday, array: true, default: []
      t.string :friday, array: true, default: []
      t.string :saturday, array: true, default: []
      t.string :sunday, array: true, default: []
      t.integer :concurrent_bookings
      t.integer :duration_allowed
      t.timestamps
    end
    add_index :policies, :venue_id
  end
end
