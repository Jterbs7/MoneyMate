class AddIconToCategoryBudgets < ActiveRecord::Migration[7.0]
  def change
    add_column :category_budgets, :icon, :string
  end
end
