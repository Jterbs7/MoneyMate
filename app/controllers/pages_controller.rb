class PagesController < ApplicationController
  def home
    @expenses = Expense.all.sort_by(&:date).reverse
    @month_chart = CategoryBudget.group(:name).sum(:amount)

    total_budget = Budget.sum(:amount)
    total_expense = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    @proportion = total_expense / total_budget.to_f
    @monthly_income = current_user.profile.monthly_income



    days_total_expense = Expense.where(date: Time.now.beginning_of_week..Time.now.end_of_week).sum(:amount)
    days_income = @monthly_income / 4

    @days_chart_data = [
      ['Expenses', days_total_expense],
      ['Income', days_income]
    ]

    month_income = @monthly_income
    month_total_expense = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)

    @month_chart_data = [
      ['Expenses', month_total_expense],
      ['Income', month_income]
    ]

    year_income = @monthly_income * 12
    year_total_expenses = Expense.where(date: Time.now.beginning_of_year..Time.now.end_of_year).sum(:amount)

    @year_chart_data = [
      ['Expenses', year_total_expenses],
      ['Income', year_income]
    ]

    if @proportion > 1
      @message = Tip.where(advice_level: 'over_100').sample.content
    elsif @proportion >= 0.9
      @message = Tip.where(advice_level: '90_100').sample.content
    elsif @proportion >= 0.7
      @message = Tip.where(advice_level: '70_89').sample.content
    elsif @proportion >= 0.5
      @message = Tip.where(advice_level: '50_69').sample.content
    elsif @proportion >= 0.31
      @message = Tip.where(advice_level: '31_49').sample.content
    elsif @proportion >= 0
      @message = Tip.where(advice_level: '0_30').sample.content
    else
      @message = "Start spending to see your budget performance!"
    end
  end
end
