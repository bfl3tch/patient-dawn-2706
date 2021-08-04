require 'rails_helper'

RSpec.describe 'The competitions new page' do
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

    visit "/competitions/#{@competition1.id}/new"

  end

  it 'displays a form to register a new team' do
    expect(page).to have_content("Register a new team")
  end

  it 'redirects you to the show page after completing the form' do
    fill_in :hometown, with: 'Marco'
    fill_in :nickname, with: 'Eagles'
    click_on "Submit"

    expect(current_path).to eq("/competitions/#{@competition1.id}")
  end

  it 'adds that team to the competition show page' do
    fill_in :hometown, with: 'Marco'
    fill_in :nickname, with: 'Eagles'
    click_on "Submit"

    expect(current_path).to eq("/competitions/#{@competition1.id}")

    expect(page).to have_content("Marco Eagles")
    end
end
