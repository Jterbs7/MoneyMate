class CategoryBudgetsController < ApplicationController
  before_action :set_category_budget, only: :show

  def index
    # total_categories = CategoryBudget.sum(:amount)
    # @data = CategoryBudget.group(:name).sum(:amount) { |v| (v / total_categories.to_f) * 100 }
    @category_budgets = CategoryBudget.all
  end

  def show
    @budgets = @category_budget.budgets
  end

  private

  def set_category_budget
    @category_budget = CategoryBudget.find(params[:id])
  end
end
