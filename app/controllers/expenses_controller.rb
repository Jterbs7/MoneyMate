class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # def index
  #   @expenses = Expense.all
  # end

  def index
    @expenses_last_seven_days = Expense.where('created_at >= ?', 7.days.ago)
    @total_expenses = Expense.sum(:amount)
    @total_income = current_user.profile.monthly_income
    beginning_of_month = Time.current.beginning_of_month
    end_of_month = beginning_of_month.end_of_month
    @total_expenses_current_month = current_user.expenses.where(created_at: beginning_of_month..end_of_month).sum(:amount)
    # @total_expenses_current_month = Expense.where(user_id: current_user.id).where(created_at: beginning_of_month..end_of_month)
    # @total_expenses_current_month = Expense.where(user_id: current_user.id)
    @potential_savings = @total_income - @total_expenses_current_month
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to @expense, notice: 'Expense was successfully added.'
    else
      render :new
    end
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
end
