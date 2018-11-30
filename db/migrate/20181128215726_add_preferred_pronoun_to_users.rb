class AddPreferredPronounToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Preferred_Pronoun, :string
  end
end
