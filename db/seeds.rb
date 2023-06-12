# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing the database..."

Expense.destroy_all
Budget.destroy_all
CategoryBudget.destroy_all
Profile.destroy_all
User.destroy_all

# create a few users

puts "Creating some users"

main_user = User.create!(
  email: "john@john.com",
  password: "password"
  # monthly_income: "40_000" Assign to Profile
)

Profile.create!(
  first_name: "John",
  second_name: "Doe",
  username: "johndoe",
  age: 30,
  monthly_income: 20_000,
  user_id: main_user.id
)

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    # monthly_income: rand(20_000..80_000) Assign to Profile
    )
end

puts "#{User.count} users created"

# budget_categories = ['Eating Out', 'Taxis', 'Gym', 'Rent', 'Takeaways', 'Drinking']
# budget_categories = ['Eating Out', 'Taxis', 'Gym', 'Rent', 'Takeaways', 'Drinking']

puts "Creating some example budgets and budget categories"

travel_category = CategoryBudget.create!(
  name: "Travel",
  amount: 4000,
  month: "January",
  user_id: main_user.id
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
  user_id: main_user.id
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
  amount: 1500,
  month: "January",
  user_id: main_user.id
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
  amount: 3500,
  month: "January",
  user_id: main_user.id
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
  amount: 1000,
  month: "January",
  user_id: main_user.id
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
  user_id: main_user.id
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
  user_id: main_user.id
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
  user_id: main_user.id
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
  user_id: main_user.id
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

# CategoryBudget.all.each do |category_budget|
#   Budget.create!(
#     name: Faker::Commerce.department(max: 1),
#     amount: (category_budget.amount / 2),
#     category_budget_id: category_budget.id
#   )
# end
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
                   rand(1..10)
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
      date: Faker::Date.between(from: 24.weeks.ago, to: Date.today),
      budget: budget
    )
  end
end

# --------------------
# Budget.all.each do |budget|
#   8.times do
#     if expenses_categories[budget.category.name] && expenses_categories[budget.category.name][budget.name]
#       description = expenses_categories[budget.category.name][budget.name].sample
#       merchant = expenses_categories[budget.category.name][budget.name].sample
#     else
#       description = "Other"
#       merchant = "Other"
#     end

#     Expense.create!(
#       amount: rand(1..600),
#       description: description,
#       merchant: merchant,
#       date: Faker::Date.between(from: 4.weeks.ago, to: Date.today),
#       budget: budget
#     )
#   end
# end
# Budget.all.each do |budget|
#   8.times do
#     Expense.create!(
#       amount: rand(1..600),
#       description: Faker::Beer.name,
#       merchant: Faker::Fantasy::Tolkien.character,
#       date: Faker::Date.between(from: 4.weeks.ago, to: Date.today),
#       budget: budget
#     )
#   end
# end

puts "Done"
