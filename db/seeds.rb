# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@team1 = Team.create!(nickname: 'Bruisers', hometown: 'Boston')
@team2 = Team.create!(nickname: 'Sliders', hometown: 'Slidell')

@player1 = @team1.players.create(name: 'joe', age: 13)
@player2 = @team1.players.create(name: 'bob', age: 12)
@player3 = @team2.players.create(name: 'henry', age: 11)
@player4 = @team2.players.create(name: 'mike', age: 15)

@competition1 = Competition.create!(name: 'LLWS', location: 'Hersheytown', sport: 'baseball')
@competition2 = Competition.create!(name: 'BVWC', location: 'Hersheytown', sport: 'beach volleyball')

@event1 = Event.create!(competition: @competition1, team: @team1)
@event2 = Event.create!(competition: @competition1, team: @team2)
@event3 = Event.create!(competition: @competition2, team: @team1)
@event4 = Event.create!(competition: @competition2, team: @team2)
