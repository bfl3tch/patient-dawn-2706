require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:events) }
    it { should have_many(:competitions).through(:events) }
  end

  describe 'methods' do
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
    end

    describe '#average_team_age' do
      it 'determines the average age of all players in a competition' do
        expect(@team1.average_team_age).to eq(12.5)
        expect(@team2.average_team_age).to eq(13)
      end
    end

    describe '::sort_by_age_average' do
      it 'sorts the teams by average age of the players descending' do
        expect(Team.sort_by_age_average).to eq([@team2, @team1])
      end
    end
  end
end
