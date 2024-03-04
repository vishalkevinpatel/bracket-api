class Team < ApplicationRecord
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id"
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id"
  has_many :winner_games, class_name: "Game", foreign_key: "winner_team_id"
  # has_many :matches, class_name: "Match", foreign_key: "pick_team_id"
  # has_many :matches, class_name: "Match", foreign_key: "winner_team_id"
end
