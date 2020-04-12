class RenamePostIdColumnToNotifications < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :post_id, :micropost_id
  end
end
