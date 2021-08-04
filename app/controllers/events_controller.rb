class EventsController < ApplicationController
  def create
    # require "pry"; binding.pry
    competition = Competition.find(params[:id])
    team = competition.teams.create!(nickname: params[:nickname], hometown: params[:hometown])
    # Maintenance.create!(mechanic_id: mechanic.id, ride_id: params[:ride_id])
    # mechanic.maintenances.create!(ride_id: ride)
    # ride.maintenances.create!(mechanic: mechanic)
    # competition.teams << team
    redirect_to "/competitions/#{competition.id}"
  end
end
