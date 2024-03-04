# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

CSV.foreach("lib/seeds/users.csv", headers: true, encoding: "ISO-8859-1") do |row|
  t = User.create(row.to_h)
  puts "#{t.username}, #{t.id} saved"
end
puts "There are now #{User.count} rows in the users table"

CSV.foreach("lib/seeds/brackets.csv", headers: true, encoding: "ISO-8859-1") do |row|
  t = Bracket.create(row.to_h)
  puts "#{t.name}, #{t.user_id} saved"
end
puts "There are now #{Bracket.count} rows in the brackets table"

CSV.foreach("lib/seeds/teams.csv", headers: true, encoding: "ISO-8859-1") do |row|
  t = Team.create(row.to_h)
  puts "#{t.name}, #{t.superseed} saved"
end
puts "There are now #{Team.count} rows in the teams table"

CSV.foreach("lib/seeds/games.csv", headers: true, encoding: "ISO-8859-1") do |row|
  t = Game.create(row.to_h)
  puts "#{t.id} saved"
end
puts "There are now #{Game.count} rows in the games table"

CSV.foreach("lib/seeds/matches.csv", headers: true, encoding: "ISO-8859-1") do |row|
  t = Match.create(row.to_h)
  puts "#{t.id} saved"
end
puts "There are now #{Match.count} rows in the matches table"
