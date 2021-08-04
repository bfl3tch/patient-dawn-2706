require 'rails_helper'

RSpec.describe 'The competitions show page' do
  before(:each) do
    @team1 = Team.create!(nickname: 'Bruisers', hometown: 'Boston')
    @team2 = Team.create!(nickname: 'Sliders', hometown: 'Slidell')
    @team3 = Team.create!(nickname: 'Fakers', hometown: 'Fargo')

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

    visit "/competitions/#{@competition1.id}"

  end

  it 'displays the name, location, and sport of the competition' do
    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition1.location)
    expect(page).to have_content(@competition1.sport)
  end

  it 'displays the nickname and hometown of each team in this competition' do
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team2.hometown)
    expect(page).to_not have_content(@team3.nickname)
    expect(page).to_not have_content(@team3.hometown)
  end

  it 'displays the average age of all players in the competition' do
    expected = ((13 + 12 + 11 + 15) / 4.0)
    expect(page).to have_content("Average age of all players in the competition: #{expected}")
  end

end
