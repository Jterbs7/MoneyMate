class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.float :amount
      t.references :category_budget, foreign_key: true

      t.timestamps
    end
  end
end
