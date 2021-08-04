class Competition < ApplicationRecord
  has_many :events
  has_many :teams, through: :events
end
