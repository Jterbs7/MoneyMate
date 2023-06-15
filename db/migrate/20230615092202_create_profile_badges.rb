class CreateProfileBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_badges do |t|
      t.string :month
      t.references :profile, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
