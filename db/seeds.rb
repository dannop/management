# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Users.delete_all
Teams.delete_all
Projects.delete_all
Directory.delete_all
Goals.delete_all
Tasks.delete_all

1.times do
  User.create([{
  first_name: "Kirigaya",
  last_name: "Kazuto",
  email: "sword@art.com",
  password_digest: "123456",
  admin: true,
  developer: true,
  pmo: true,
  director: true
    }])
end

29.times do
  User.create([{
  first_name: Faker::DragonBall.character,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password_digest: Faker::Internet.password(8),
  developer: true,
  advisor: true
    }])
end

10.times do
  Team.create([{
  name: Faker::LeagueOfLegends.rank,
  number_of_members: rand(1..5),
  limit_of_projects: rand(1..10)
    }])
end

100.times do
  Project.create([{
  name: Faker::LeagueOfLegends.masteries,
  client: Faker::LeagueOfLegends.champion,
  description: Faker::Lorem.paragraph,
  value: rand(100..10000),
  start_date: Faker::Date.between(Date.today, 3.year.from_now),
  end_date: Faker::Date.between(Date.today, 3.year.from_now),
  current_sprint: 1,
  total_sprint: rand(5..50)
    }])
end

5.times do
  Directory.create([{
  name: Faker::OnePiece.sea
    }])
end

15.times do
  Goal.create([{
  name: Faker::Superhero.power,
  begin_date: Faker::Date.between(Date.today, 3.year.from_now),
  end_date: Faker::Date.between(Date.today, 3.year.from_now)
    }])
end

15.times do
  Task.create([{
  name: Faker::StarWars.quote,
  description: Faker::Lorem.paragraph
    }])
end
