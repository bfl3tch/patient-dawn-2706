class Event < ApplicationRecord
  belongs_to :competition
  belongs_to :team
end
