class Bracket < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :group_brackets
  has_many :groups, through: :group_brackets

  # Method to calculate scores
  def calculate_scores
    # Initialize round scores to 0
    self.round1 = 0
    self.round2 = 0
    self.round3 = 0
    self.round4 = 0
    self.round5 = 0
    self.round6 = 0

    self.matches.includes(:game).each do |match|
      next unless match.pick_team_id == match.winner_team_id # Skip if pick is not the winner

      round = match.game.round
      case round
      when 1
        self.round1 += 1
      when 2
        self.round2 += 2
      when 3
        self.round3 += 4
      when 4
        self.round4 += 8
      when 5
        self.round5 += 16
      when 6
        self.round6 += 32
      end
    end

    # Sum up all round points for total_points
    self.total_points = self.round1 + self.round2 + self.round3 + self.round4 + self.round5 + self.round6
    self.save
  end
end
