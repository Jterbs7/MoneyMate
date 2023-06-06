class BudgetsController < ApplicationController

  def index
    @budgets = user.budgets
  end

  def show
    @budgets = user.budgets.find(params[:id])
  end

  def new
    @budget = user.budgets.new
  end

  def create
    @budget = user.budgets.new(budget_params)

    if @budget.save
      redirect_to @budget, notice: 'Budget created successfully.'
    else
      render :new
    end
  end

  def edit
    @budget = user.budgets.find(params[:id])
  end

  def update
    @budget = user.budgets.find(params[:id])

    if @budget.update(budget_params)
      redirect_to @budget, notice: 'Budget updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @budget = user.budgets.find(params[:id])
    @budget.destroy
    redirect_to budgets_url, notice: 'Budget deleted successfully.'
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :description) # Adjust permitted parameters as per your budget model
  end
end
