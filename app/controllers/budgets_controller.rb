class BudgetsController < ApplicationController

  def index
    @budgets = current_user.budgets
  end

  def show
    @budget = Budget.find(params[:id]) unless params[:id] == 'new'

    if @budget.nil?
      redirect_to new_budget_path, alert: 'Budget not found.'
    end
    # get all expenses with "budget" as category budget
    @budget_expenses = Expense.where(budget: @budget)
    @total_expenses = @budget_expenses.sum(:amount)
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = current_user.budgets.new(budget_params)

    if @budget.save
      redirect_to @budget, notice: 'Budget created successfully 🎉🎉🎉'
    else
      render :new
    end
  end

  def edit
    @budget = current_user.budgets.find(params[:id])
  end

  def update
    @budget = current_user.budgets.find(params[:id])

    if @budget.update(budget_params)
      redirect_to @budget, notice: 'Budget updated successfully 💪🏽💪🏽💪🏽'
    else
      render :edit
    end
  end

  def destroy
    @budget = current_user.budgets.find(params[:id])
    @budget.destroy
    redirect_to budgets_url, notice: 'Budget deleted successfully 👋🏽👋🏽👋🏽'
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :amount)
  end
end
