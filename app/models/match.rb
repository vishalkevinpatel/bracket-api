class Match < ApplicationRecord
  belongs_to :game
  belongs_to :pick_team, class_name: "Team", optional: true
  belongs_to :winner_team, class_name: "Team", optional: true
end
