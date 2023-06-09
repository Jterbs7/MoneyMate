class CategoryBudgetsController < ApplicationController
  before_action :set_category_budget, except: [:index, :new, :create]

  def index
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
