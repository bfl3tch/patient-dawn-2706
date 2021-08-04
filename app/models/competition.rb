class Competition < ApplicationRecord
  has_many :events
  has_many :teams, through: :events

  def average_age_of_players
    teams.joins(:players).select('players.*').average(:age).to_f
  end
end
