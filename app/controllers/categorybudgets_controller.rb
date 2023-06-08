class CategoryBudgetsController < ApplicationController
  before_action :set_category_budget, except: [:index, :new, :create]

  def index
    @category_budgets = CategoryBudget.all
  end

  def show
    @category_budgets = CategoryBudget.find(params[:id])
  end
end
