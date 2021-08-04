class Team < ApplicationRecord
  has_many :players
  has_many :events
  has_many :competitions, through: :events
end
