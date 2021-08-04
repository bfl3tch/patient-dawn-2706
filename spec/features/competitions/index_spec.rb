require 'rails_helper'

RSpec.describe 'The competitions index page' do
  before(:each) do
    @team1 = Team.create!(nickname: 'Bruisers', hometown: 'Boston')
    @team2 = Team.create!(nickname: 'Sliders', hometown: 'Slidell')

    @player1 = @team1.players.create(name: 'joe', age: 13)
    @player2 = @team1.players.create(name: 'bob', age: 12)
    @player3 = @team2.players.create(name: 'henry', age: 11)
    @player4 = @team2.players.create(name: 'mike', age: 15)

    @competition1 = Competition.create!(name: 'LLWS', location: 'Hersheytown', sport: 'baseball')
    @competition1 = Competition.create!(name: 'BVWC', location: 'Hersheytown', sport: 'beach volleyball')

    @event1 = Event.create!(competition: @competition1, team: @team1)
    @event2 = Event.create!(competition: @competition1, team: @team2)
    @event3 = Event.create!(competition: @competition2, team: @team1)
    @event4 = Event.create!(competition: @competition2, team: @team2)

    visit '/competitions'

  end

  it 'displays the names of all the competitions as links' do
    expect(page).to have_link(@competition1.name)
    expect(page).to have_link(@competition2.name)
  end
  it 'actually redirects you to that show page when you click' do
    click_link "#{@competition1.name}"

    expect(current_path).to eq("/competitions/#{@competition1.id}")
  end
end
