# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Tyler", email: "Tyler@email.com", password: "password", public_profile: false, time_zone: "Eastern Time (US & Canada)", hourly_rate: 15)
User.create!(name: "Angela", email: "angela@email.com", password: "password")
User.create!(name: "Phil", email: "Phil_is_awesome@yeah.com", password: "password", public_profile: false, time_zone: "Eastern Time (US & Canada)", hourly_rate: 12.33)
User.create!(name: "Kevin", email: "kevin@hotmail.com", password: "password", public_profile: false, time_zone: "Eastern Time (US & Canada)", hourly_rate: 12.33)
User.create!(name: "Dead", email: "DeamonKiller@hunter.com", password: "password", public_profile: false, time_zone: "Eastern Time (US & Canada)", hourly_rate: 12.33)
User.create!(name: "Julie", email: "julie@email.com", password: "password", public_profile: false, time_zone: "Eastern Time (US & Canada)", hourly_rate: 15)


Project.create!(user_id: 1, name: "Fire on the Mountaintop", description: "Landscape, oil painting, 24x36")
Project.create!(user_id: 1, name: "Portrait of the Artist", description: "Self portrait, acrylic painting, 16x24")
Project.create!(user_id: 1, name: "Still Life with Fruit", description: "Still life, oil painting, 18x24")
Project.create!(user_id: 1, name: "Still Life with Fruit Print", description: "9x12 glossy print")
Project.create!(user_id: 1, name: "Still Life with Fruit Small Print", description: "4x6 matte print")
Project.create!(user_id: 1, name: "Collie Portrait", description: "Dog portrait, acrylic painting, 8x10")

Sale.create!(user_id: 1, project_id: 5, sales_channel_id: 1, gross: 100, net: 77.84, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 5, sales_channel_id: 3, gross: 100, net: 77.84, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 5, sales_channel_id: 4, gross: 100, net: 77.84, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 4, sales_channel_id: 3, gross: 200, net: 109.09, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 4, sales_channel_id: 2, gross: 200, net: 109.09, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 4, sales_channel_id: 1, gross: 200, net: 109.09, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 3, sales_channel_id: 7, gross: 500.23, net: 245.87, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 2, sales_channel_id: 5, gross: 1500.23, net: 1245.87, date: Date.today - rand(1..990).days)
Sale.create!(user_id: 1, project_id: 1, sales_channel_id: 6, gross: 5300.23, net: 2345.87, date: Date.today - rand(1..990).days)

BusinessExpense.create!(user_id: 1, name: "Studio rent", description: "Monthly rent", amount: 400, recurring: true, duration: "1 month", date: "Tue, 17 Nov 2015")

MaterialPurchase.create!(user_id: 1, name: "4x6 Canvas", cost: 24, units: 16, units_remaining: 16)
MaterialPurchase.create!(user_id: 1, name: "8x10 Canvas", cost: 30, units: 16, units_remaining: 16)
MaterialPurchase.create!(user_id: 1, name: "9x12 Canvas", cost: 32, units: 16, units_remaining: 16)
MaterialPurchase.create!(user_id: 1, name: "16x24 Canvas", cost: 65, units: 16, units_remaining: 16)
MaterialPurchase.create!(user_id: 1, name: "18x24 Canvas", cost: 30, units: 2, units_remaining: 2)
MaterialPurchase.create!(user_id: 1, name: "24x36 Canvas", cost: 24, units: 1, units_remaining: 1)
MaterialPurchase.create!(user_id: 1, name: "48x60 Canvas", cost: 55, units: 1, units_remaining: 1)
MaterialPurchase.create!(user_id: 1, name: "Alizarin Crimson oil paint", cost: 12, units: 1, units_remaining: 0.6)

ProjectCost.create!(user_id: 1, project_id: 1, cost_type: "Shipping and handling", amount: 12)

projects = Project.all

50.times do
  start = Faker::Time.backward(rand(1..100))
  stop = start + (rand(1..10)).hours
  TimeEntry.create!(project_id: projects.sample.id, start_time: start, stop_time: stop, total_time: stop.to_i - start.to_i, date: start.to_date )
end

channels = ["Artist website", "Personal Reference", "Etsy website", "Gallery tour", "Shop Gallery", "Downtown Gallery", "Festival Booth"]
x = 0
6.times do
  SalesChannel.create!(name: channels[x], description: Faker::Address.street_address, user_id: 1)
  x += 1
end

SalesGoal.create!(user_id: 1, amount: Faker::Number.between(0, 1000),
  length_of_time: "10 days", start_time: Date.today, end_time: Date.today + 10.days)
