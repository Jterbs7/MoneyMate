class PagesController < ApplicationController
  before_action :award_badge
  def home
    @expenses = Expense.all.sort_by(&:date).reverse
    @month_chart = CategoryBudget.group(:name).sum(:amount)

    total_budget = Budget.sum(:amount)
    total_expense = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    @proportion = total_expense / total_budget.to_f
    @monthly_income = current_user.profile.monthly_income



    days_spent = Expense.where(date: Time.now.beginning_of_week..Time.now.end_of_week).sum(:amount)
    days_remaining = (@monthly_income / 4) - days_spent

    @days_chart_data = [
      ['ZAR Spent', days_spent],
      ['ZAR Remaining', days_remaining]
    ]

    month_spent = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    month_remaining = @monthly_income - month_spent

    @month_chart_data = [
      ['ZAR ZAR Spent', month_spent],
      ['ZAR Income', month_remaining]
    ]

    year_spent = Expense.where(date: Time.now.beginning_of_year..Time.now.end_of_year).sum(:amount)
    year_remaining = (@monthly_income * 12) - year_spent

    @year_chart_data = [
      ['ZAR Spent', year_spent],
      ['ZAR Remaining', year_remaining]
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
