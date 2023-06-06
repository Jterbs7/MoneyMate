class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.string :description
      t.string :merchant
      t.datetime :date
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
