class AddAboutToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :About, :text
  end
end
