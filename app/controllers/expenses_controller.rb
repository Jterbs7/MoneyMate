class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # def index
  #   @expenses = Expense.all
  # end

  def index
    @expenses_search = nil
    @expenses_last_seven_days = Expense.where('date >= ?', 7.days.ago.to_date).order(date: :desc)
    @total_expenses = Expense.sum(:amount)
    @total_income = current_user.profile.monthly_income
    beginning_of_month = Time.current.beginning_of_month
    end_of_month = beginning_of_month.end_of_month
    # check if this is correct
    @total_expenses_current_month = current_user.expenses.where(created_at: beginning_of_month..end_of_month).sum(:amount)
    @potential_savings = @total_income - @total_expenses_current_month
    if params[:query].present?
      @expenses_search = Expense.joins(budget: :category)
                                .where('expenses.merchant ILIKE :query
                                        OR expenses.description ILIKE :query
                                        OR budgets.name ILIKE :query
                                        OR category_budgets.name ILIKE :query',
                                        query: "%#{params[:query]}%")
                                .order(date: :desc)
    end
  end

  def show
  end

  def new
    @expense = Expense.new
    @budget = Budget.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to @expense, notice: 'Expense was successfully added.'
    else
      render :new
    end
    # @budget = Budget.new(budget_params)
    # if @budget.save
    #   redirect_to @budget, notice: 'Budget was successfully added.'
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully deleted.'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :description, :merchant, :date, :budget_id)
  end

  def budget_params
    params.require(:budget).permit(:name, :amount, :category_budget_id)
  end
end
