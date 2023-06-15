class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def award_badge
    total_budget = Budget.sum(:amount)
    total_expense = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    @proportion = total_expense / total_budget.to_f

    current_month_badge = current_user.profile.profile_badges.where(month: Time.now.month).first

    if @proportion > 1
      @badge = Badge.find_by(name: 'Fail')
    elsif @proportion >= 0.9
      @badge = Badge.find_by(name: 'Bronze')
    elsif @proportion >= 0.7
      @badge = Badge.find_by(name: 'Silver')
    elsif @proportion >= 0.5
      @badge = Badge.find_by(name: 'Gold')
    else
      @badge = Badge.find_by(name: 'Placeholder')
    end

    if current_month_badge.nil?
      new_profile_badge = ProfileBadge.new
      new_profile_badge.badge = @badge
      new_profile_badge.profile = current_user.profile
      new_profile_badge.month = Time.now.month
      new_profile_badge.save
    else
      current_month_badge.badge = @badge
      current_month_badge.save
    end
  end
end
