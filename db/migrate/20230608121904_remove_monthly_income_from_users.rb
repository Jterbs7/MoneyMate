class RemoveMonthlyIncomeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :monthly_income, :decimal
  end
end
