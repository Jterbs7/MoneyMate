class CategoryBudgetsController < ApplicationController
  before_action :award_badge

  def index
    # Get all category budgets for the currently logged in user and include associated budgets in the same query (prevents N+1 queries)
    @category_budgets = current_user.category_budgets.includes(:budgets)
    @category_budgets_expense_percentages = @category_budgets.map do |category_budget|
      budget_expenses = category_budget.budgets.map do |budget|
        budget.expenses.where('date >= ?', Time.current.beginning_of_month.to_date).sum(:amount)
      end.sum

      percentage = ((budget_expenses / category_budget.amount) * 100).round(2)
      [category_budget.id, percentage]
    end.to_h
  end


  def show
    @category_budget = CategoryBudget.find(params[:id])

    if @category_budget.nil?
      redirect_to category_budgets_path, alert: 'Budget not found.'
    end
    @budget_expenses = Expense.where(budget: @budget)
    @total_expenses = @budget_expenses.sum(:amount)
  end

  private

  def set_category_budget
    @category_budget = CategoryBudget.find(params[:id])
  end
end
