class AddTypeToEmail < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :type, :text
  end
end
