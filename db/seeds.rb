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
User.destroy_all

# create a few users

puts "Creating some users"

main_user = User.create!(
  email: "john@john.com",
  password: "password",
  # monthly_income: "40_000" Assign to Profile
)

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    # monthly_income: rand(20_000..80_000) Assign to Profile
    )
end

puts "#{User.count} users created"

budget_categories = ['Travel', 'Groceries', 'Entertainment', 'Rent']

puts "Creating some budget categories"

travel_category = CategoryBudget.create!(
  name: "Travel",
  amount: 20000,
  month: "January",
  user_id: main_user.id
)

entertainment_category = CategoryBudget.create!(
  name: "Entertainment",
  amount: 1000,
  month: "January",
  user_id: main_user.id
)

housing_category = CategoryBudget.create!(
  name: "Housing",
  amount: 5000,
  month: "January",
  user_id: main_user.id
)

food_category = CategoryBudget.create!(
  name: "Food",
  amount: 4000,
  month: "January",
  user_id: main_user.id
)

puts "#{CategoryBudget.count} budget categories created"

CategoryBudget.all.each do |category_budget|
  Budget.create!(
    name: Faker::Commerce.department(max: 1),
    amount: (category_budget.amount / 2),
    category_budget_id: category_budget.id
  )
end

Budget.all.each do |budget|
  3.times do
    Expense.create!(
      amount: rand(1..80),
      description: Faker::Beer.name,
      merchant: Faker::Fantasy::Tolkien.character,
      date: Faker::Date.between(from: 2.weeks.ago, to: Date.today),
      budget: budget
    )
  end
end
