class CreateCategoryBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :category_budgets do |t|
      t.string :name
      t.integer :amount
      t.string :month
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
