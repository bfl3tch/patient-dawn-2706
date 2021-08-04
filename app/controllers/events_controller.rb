class EventsController < ApplicationController
  def create
    competition = Competition.find(params[:id])
    team = competition.teams.create!(nickname: params[:nickname], hometown: params[:hometown])
    redirect_to "/competitions/#{competition.id}"
  end
end
