class RenameTypeInEmails < ActiveRecord::Migration[6.0]
  def change
    rename_column :emails, :type, :reservation_type
  end
end
