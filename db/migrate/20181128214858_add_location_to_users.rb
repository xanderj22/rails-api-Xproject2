class AddLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Location, :string
  end
end
