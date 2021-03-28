class AddNameToEmail < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :name, :text
    add_column :emails, :object_id, :text
  end
end
