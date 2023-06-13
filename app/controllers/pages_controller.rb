class PagesController < ApplicationController
  def home
    @expenses = Expense.all.sort_by(&:date).reverse
    @month_chart = CategoryBudget.group(:name).sum(:amount)

    total_budget = Budget.sum(:amount)
    total_expense = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    @proportion = total_expense / total_budget.to_f

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
