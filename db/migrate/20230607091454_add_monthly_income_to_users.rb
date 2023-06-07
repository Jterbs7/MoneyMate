class AddMonthlyIncomeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :monthly_income, :decimal
  end
end
