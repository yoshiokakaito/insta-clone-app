class Add < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :image_id, :string
  end
end
