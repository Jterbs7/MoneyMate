# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing the database..."

ProfileBadge.destroy_all
Badge.destroy_all
Expense.destroy_all
Budget.destroy_all
CategoryBudget.destroy_all
Profile.destroy_all
User.destroy_all

puts "Creating some users"

main_user = User.create!(
  email: "john@john.com",
  password: "password"
)

Profile.create!(
  first_name: "John",
  second_name: "Doe",
  username: "johndoe",
  age: 30,
  monthly_income: 20_000,
  user_id: main_user.id
)

puts "#{User.count} users created"

puts "Creating some example budgets and budget categories"

travel_category = CategoryBudget.create!(
  name: "Travel",
  amount: 4000,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686757273/icons8-car-48_2_ofnsus.png"
)

travel_budget_names = ['Uber', 'Train', 'Bus', 'Fuel']

travel_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: travel_category.amount / travel_budget_names.count,
    category_budget_id: travel_category.id
  )
end

accommodation_category = CategoryBudget.create!(
  name: "Accommodation",
  amount: 8000,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686757394/icons8-house-48_pckg8o.png"

)

accommodation_budget_names = ['Rent', 'Home Insurance', 'Hotel']

accommodation_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: accommodation_category.amount / accommodation_budget_names.count,
    category_budget_id: accommodation_category.id
  )
end

bills_category = CategoryBudget.create!(
  name: "Utilities",
  amount: 2500,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686757475/icons8-tools-48_dvoiii.png"

)

bills_budget_names = ['Electricity', 'Gas', 'Phone', 'Water', 'Internet']

bills_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: bills_category.amount / bills_budget_names.count,
    category_budget_id: bills_category.id
  )
end

lifestyle_category = CategoryBudget.create!(
  name: "Lifestyle",
  amount: 5000,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686758382/icons8-food-and-wine-48_vd1mlo.png"

)

lifestyle_budget_names = ['Eating Out', 'Movies', 'Rugby', 'Gigs', 'Gym']

lifestyle_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: lifestyle_category.amount / lifestyle_budget_names.count,
    category_budget_id: lifestyle_category.id
  )
end

groceries_category = CategoryBudget.create!(
  name: "Groceries",
  amount: 3000,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686757698/icons8-vegetarian-food-48_mehv07.png"
)

groceries_budget_names = ['Food', 'Cleaning Supplies', 'Pet Food', 'Toiletries']

groceries_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: groceries_category.amount / groceries_budget_names.count,
    category_budget_id: groceries_category.id
  )
end

subscriptions_category = CategoryBudget.create!(
  name: "Subscriptions",
  amount: 975,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686757868/icons8-pay-48_dfj2xk.png"
)

subscriptions_budget_names = ['Streaming Services', 'Software Subscriptions', 'Gaming']

subscriptions_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: subscriptions_category.amount / subscriptions_budget_names.count,
    category_budget_id: subscriptions_category.id
  )
end

shopping_category = CategoryBudget.create!(
  name: "Personal Shopping",
  amount: 850,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686757945/icons8-shopping-bag-48_y1hfgx.png"

)

shopping_budget_names = ['Clothing', 'Beauty Products', 'Treats']

shopping_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: shopping_category.amount / shopping_budget_names.count,
    category_budget_id: shopping_category.id
  )
end

savings_category = CategoryBudget.create!(
  name: "Savings",
  amount: 4000,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686758017/icons8-money-box-48_y15jmq.png"
)

savings_budget_names = ['Holiday', 'New car', 'Macbook Pro']

savings_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: savings_category.amount / savings_budget_names.count,
    category_budget_id: savings_category.id
  )
end

education_category = CategoryBudget.create!(
  name: "Education",
  amount: 700,
  month: "January",
  user_id: main_user.id,
  icon: "https://res.cloudinary.com/dw1yozuyk/image/upload/v1686758087/icons8-graduation-cap-48_tvyvaq.png"
)

education_budget_names = ['Uni Fees', 'Le Wagon', 'Books']

education_budget_names.each do |name|
  Budget.create!(
    name: name,
    amount: education_category.amount / education_budget_names.count,
    category_budget_id: education_category.id
  )
end

puts "#{CategoryBudget.count} budget categories created and #{Budget.count} budgets created"


puts "Creating some expenses"

expenses_categories = {
  "Travel" => {
    "Uber" => ["Uber Ride"],
    "Train" => ["Metrorail", "Gautrain"],
    "Bus" => ["Greyhound", "Megabus"],
    "Fuel" => ["Engen", "Sasol", "BP"]
  },
  "Accommodation" => {
    "Rent" => ["Rent Payment"],
    "Hotel" => ["Marriott", "Holiday Inn"]
  },
  "Utilities" => {
    "Electricity" => ["Eskom"],
    "Gas" => ["Eskom"],
    "Phone" => ["MTN"],
    "Water" => ["Siza"],
    "Internet" => ["Lightspeed"],
    "Home Insurance" => ["Hippo"]
  },
  "Lifestyle" => {
    "Eating Out" => ["Villa 47", "Belly of The Beast", "Kloof Street House", "Zsa Zsa", "Test Kitchen", "Pot Luck Club"],
    "Movies" => ["Nu Metro"],
    "Rugby" => ["Newlands"],
    "Gigs" => ["Kirstenbosch"],
    "Gym" => ["Virgin"]
  },
  "Groceries" => {
    "Food" => ["Woolworths"],
    "Cleaning Supplies" => ["Checkers"],
    "Pet Food" => ["Pets Planet"],
    "Toiletries" => ["Clicks"]
  },
  "Subscriptions" => {
    "Streaming Services" => ["Netflix", "Hulu", "DSTV"],
    "Software Subscriptions" => ["Microsoft Office", "Adobe Suite"],
    "Gaming" => ["Xbox Live", "Playstation Plus"]
  },
  "Personal Shopping" => {
    "Clothing" => ["Zara", "H&M"],
    "Beauty Products" => ["Clicks"],
    "Treats" => ["iStore", "Takealot"]
  },
  "Savings" => {
    "Holiday" => ["Holiday Savings"],
    "New car" => ["Car Savings"],
    "Macbook Pro" => ["Macbook Savings"]
  },
  "Education" => {
    "Uni Fees" => ["UCT"],
    "Le Wagon" => ["Le Wagon Fee"],
    "Books" => ["Exclusive Books"]
  }
}

single_monthly_expenses = {
  "Travel" => ["Fuel"],
  "Accommodation" => ["Rent", "Hotel"],
  "Utilities" => ["Electricity", "Gas", "Phone", "Water", "Internet", "Home Insurance"],
  "Subscriptions" => ["Streaming Services", "Software Subscriptions", "Gaming"],
  "Savings" => ["Holiday", "New car", "Macbook Pro"],
  "Education" => ["Uni Fees", "Le Wagon"]
}

# ----------------------------------

Budget.all.each do |budget|
  num_expenses = if single_monthly_expenses[budget.category.name]&.include?(budget.name)
                   1
                 else
                   rand(1..4)
                 end

  num_expenses.times do
    if expenses_categories[budget.category.name] && expenses_categories[budget.category.name][budget.name]
      description = expenses_categories[budget.category.name][budget.name].sample
      merchant = expenses_categories[budget.category.name][budget.name].sample
    else
      description = "Other"
      merchant = "Other"
    end

    Expense.create!(
      amount: rand(1..600),
      description: description,
      merchant: merchant,
      date: Faker::Date.between(from: Time.current.beginning_of_month, to: Date.today),
      budget: budget
    )
  end

  num_expenses.times do
    if expenses_categories[budget.category.name] && expenses_categories[budget.category.name][budget.name]
      description = expenses_categories[budget.category.name][budget.name].sample
      merchant = expenses_categories[budget.category.name][budget.name].sample
    else
      description = "Other"
      merchant = "Other"
    end

    Expense.create!(
      amount: rand(1..600),
      description: description,
      merchant: merchant,
      date: Faker::Date.between(from: 1.month.ago.beginning_of_month, to: 1.month.ago.end_of_month),
      budget: budget
    )
  end

  num_expenses.times do
    if expenses_categories[budget.category.name] && expenses_categories[budget.category.name][budget.name]
      description = expenses_categories[budget.category.name][budget.name].sample
      merchant = expenses_categories[budget.category.name][budget.name].sample
    else
      description = "Other"
      merchant = "Other"
    end

    Expense.create!(
      amount: rand(1..600),
      description: description,
      merchant: merchant,
      date: Faker::Date.between(from: 2.month.ago.beginning_of_month, to: 2.month.ago.end_of_month),
      budget: budget
    )
  end

  num_expenses.times do
    if expenses_categories[budget.category.name] && expenses_categories[budget.category.name][budget.name]
      description = expenses_categories[budget.category.name][budget.name].sample
      merchant = expenses_categories[budget.category.name][budget.name].sample
    else
      description = "Other"
      merchant = "Other"
    end

    Expense.create!(
      amount: rand(1..600),
      description: description,
      merchant: merchant,
      date: Faker::Date.between(from: 3.month.ago.beginning_of_month, to: 3.month.ago.end_of_month),
      budget: budget
    )
  end

  num_expenses.times do
    if expenses_categories[budget.category.name] && expenses_categories[budget.category.name][budget.name]
      description = expenses_categories[budget.category.name][budget.name].sample
      merchant = expenses_categories[budget.category.name][budget.name].sample
    else
      description = "Other"
      merchant = "Other"
    end

    Expense.create!(
      amount: rand(1..600),
      description: description,
      merchant: merchant,
      date: Faker::Date.between(from: 4.month.ago.beginning_of_month, to: 4.month.ago.end_of_month),
      budget: budget
    )
  end
end

puts "Done"

puts "Creating Tips"

Tip.create(advice_level: '0_30', content: "Off to a good start! You're within 30% of your budget 💪🏽")
Tip.create(advice_level: '0_30', content: "Great! You're being careful with your spending 🎉")
Tip.create(advice_level: '0_30', content: "You're doing well! Keep this up for the rest of the month 🤓")

Tip.create(advice_level: '31_49', content: "You're still on track with your budget. Keep it up! ✅")
Tip.create(advice_level: '31_49', content: "Well done! You're managing your budget wisely ✅")
Tip.create(advice_level: '31_49', content: "Good job! Continue monitoring your spending habits ✅")

Tip.create(advice_level: '50_69', content: "You're halfway through your budget. Keep an eye on your expenses 👀")
Tip.create(advice_level: '50_69', content: "Remember to save where you can. You're halfway through your budget 👋🏽")
Tip.create(advice_level: '50_69', content: "You've used half of your budget. Continue being mindful of your expenses 👋🏽")

Tip.create(advice_level: '70_89', content: "Watch out, you're approaching 90% of your budget. Consider cutting back on non-essential expenses 🙃")
Tip.create(advice_level: '70_89', content: "You're nearing your budget limit. It might be a good time to reassess your spending 🙃")
Tip.create(advice_level: '70_89', content: "Keep an eye on your budget. You're approaching 90% of your limit 🙃")

Tip.create(advice_level: '90_100', content: "You're really close to your set budget for the month. Try to limit your spending where you can 😚")
Tip.create(advice_level: '90_100', content: "You're nearing your budget limit. Prioritize necessary expenses 😚")
Tip.create(advice_level: '90_100', content: "Be cautious! You're close to reaching your budget for the month 😚")

Tip.create(advice_level: 'over_100', content: "You've exceeded your budget. It's time to evaluate your spending habits 😓")
Tip.create(advice_level: 'over_100', content: "Your expenses are over the budget. Let's reassess where we can cut down on some spending 😓")
Tip.create(advice_level: 'over_100', content: "You're now over your set budget for the month. Let's plan for a better financial month next 😓")
puts "#{Tip.count} tips created"

puts "Creating badges"
gold = Badge.create(name: 'Gold', message: '🎉 Congratulations! You have managed your budget excellently this month. 🏆', image: 'https://res.cloudinary.com/dw1yozuyk/image/upload/v1686832545/gold_360_hy7gql.gif')
fail_badge = Badge.create(name: 'Fail', message: '🚨 You have exceeded your budget this month. Try to save more next month. 💔', image: 'https://res.cloudinary.com/dw1yozuyk/image/upload/v1686905564/fail_tdf5im.gif')
bronze = Badge.create(name: 'Bronze', message: '🥉 You did well, but you can do even better! Keep track of your expenses! 📈', image: 'https://res.cloudinary.com/dw1yozuyk/image/upload/v1686832610/bronze_360_hcdpoo.gif')
silver = Badge.create(name: 'Silver', message: '🥈 Great work! You managed your budget quite well this month. 👏', image: 'https://res.cloudinary.com/dw1yozuyk/image/upload/v1686832601/silver_360_j32exn.gif')

ProfileBadge.create(profile_id: main_user.profile.id, badge_id: gold.id, month: 'May')
ProfileBadge.create(profile_id: main_user.profile.id, badge_id: silver.id, month: 'April')
ProfileBadge.create(profile_id: main_user.profile.id, badge_id: bronze.id, month: 'March')
ProfileBadge.create(profile_id: main_user.profile.id, badge_id: fail_badge.id, month: 'February')
ProfileBadge.create(profile_id: main_user.profile.id, badge_id: fail_badge.id, month: 'January')

puts "Created badges"
