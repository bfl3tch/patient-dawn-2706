class TeamsController < ApplicationController
  def index
    @teams = Team.all.sort_by_age_average
  end
end
