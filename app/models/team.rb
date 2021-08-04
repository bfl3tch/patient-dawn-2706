class Team < ApplicationRecord
  has_many :players
  has_many :events
  has_many :competitions, through: :events

  def average_team_age
    players.average(:age).to_f
  end

  def self.sort_by_age_average
    joins(:players)
    .select('teams.*, avg(players.age) as avg_age')
    .group(:id)
    .order('avg_age desc')
  end
end
