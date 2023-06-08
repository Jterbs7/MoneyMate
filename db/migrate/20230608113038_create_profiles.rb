class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :second_name
      t.string :username
      t.integer :age
      t.decimal :monthly_income
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
