class AddIntroductionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :user_name, :string
  end
end
