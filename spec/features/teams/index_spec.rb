require 'rails_helper'

RSpec.describe 'The teams index page' do
  before(:each) do
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

    visit '/teams'

  end

  it 'displays the nicknames of all the teams' do
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team2.nickname)
  end

  it 'shows the average age of each teams players' do
    expect(page).to have_content("Average age for the #{@team1.nickname}: #{@team1.average_team_age}")
  end

  it 'displays teams sorted by average age from highest to lowest' do
    expect(@team2.nickname).to appear_before(@team1.nickname)
  end
end
