class PagesController < ApplicationController
  def home
    @expenses = Expense.all.sort_by(&:date).reverse
  end
end
