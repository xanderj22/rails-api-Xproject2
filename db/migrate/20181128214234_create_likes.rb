class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.text :interests
      t.text :five_fave_things
      t.text :personality_types
      t.string :gender_prefs
      t.text :searching_for
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
