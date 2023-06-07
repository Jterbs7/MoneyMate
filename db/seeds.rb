# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Expense.destroy_all
Budget.destroy_all
User.destroy_all

# create a few users
5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    monthly_income: rand(20_000..80_000)
  )
end

puts "#{User.count} users created"

budget_categories = ['Travel', 'Groceries', 'Entertainment', 'Rent']

  User.all.each do |user|
  budget_categories.each do |category|
    Budget.create!(
      name: Faker::Commerce.department(max: 1),
      category: category,
      amount: Faker::Number.between(from: 200, to: (user.monthly_income / budget_categories.count)),
      user: user,
      month: Faker::Date.between(from: 2.months.ago, to: Date.today)
    )
  end
 end

Budget.all.each do |budget|
puts budget
end

puts "safe"

Budget.all.each do |budget|
  3.times do
    Expense.create!(
      amount: rand(1..80),
      description: Faker::Lorem.sentences(number: 1),
      merchant: Faker::Fantasy::Tolkien.character,
      date: Faker::Date.between(from: 2.weeks.ago, to: Date.today),
      budget: budget
    )
  end
end
