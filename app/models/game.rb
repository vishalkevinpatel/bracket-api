require "net/http"
require "uri"
require "json"

class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :winner_team, class_name: "Team", optional: true

  # Fetch API response and update winners in one method
  def self.fetch_and_update_winners
    uri = URI("https://ncaa-api.henrygd.me/scoreboard/basketball-men/d1/2023/03/16/all-conf")
    response = Net::HTTP.get(uri)
    api_response = JSON.parse(response)

    processed_games = 0

    api_response["games"].each do |game_data|
      game_info = game_data["game"]
      puts "Processing game: #{game_info["title"]}" # Debugging log

      next unless game_info["home"]["score"].present? && game_info["away"]["score"].present?

      home_team = Team.find_by(char6: game_info["home"]["names"]["char6"])
      away_team = Team.find_by(char6: game_info["away"]["names"]["char6"])

      unless home_team && away_team
        puts "Teams not found: #{game_info["home"]["names"]["char6"]} vs. #{game_info["away"]["names"]["char6"]}"
        next
      end

      game = Game.find_or_create_by(home_team: home_team, away_team: away_team)

      home_score = game_info["home"]["score"].to_i
      away_score = game_info["away"]["score"].to_i

      winner_team = home_score > away_score ? home_team : away_team

      game.update(winner_team: winner_team)
      puts "Updated game: #{game.id} with winner: #{winner_team.name}" # Debugging log
      processed_games += 1
    end

    # Moved outside the loop to ensure it's returned after all games are processed
    "Update complete. Processed #{processed_games} games."
  end

  def self.update_next_round
    # Define game dependencies directly within this method
    game_dependencies = {
      33 => [1, 2],
      34 => [3, 4],
      35 => [5, 6],
      36 => [7, 8],
      37 => [9, 10],
      38 => [11, 12],
      39 => [13, 14],
      40 => [15, 16],
      41 => [17, 18],
      42 => [19, 20],
      43 => [21, 22],
      44 => [23, 24],
      45 => [25, 26],
      46 => [27, 28],
      47 => [29, 30],
      48 => [31, 32],
      49 => [33, 34],
      50 => [35, 36],
      51 => [37, 38],
      52 => [39, 40],
      53 => [41, 42],
      54 => [43, 44],
      55 => [45, 46],
      56 => [47, 48],
      57 => [49, 50],
      58 => [51, 52],
      59 => [53, 54],
      60 => [55, 56],
      61 => [57, 58],
      62 => [59, 60],
      63 => [61, 62],
    }

    game_dependencies.each do |next_round_game_id, dependent_game_ids|
      # Find the games that correspond to the dependencies
      dependent_games = Game.where(matrix: dependent_game_ids)

      # Ensure we have winners for both dependent games before proceeding
      next unless dependent_games.count == dependent_game_ids.count && dependent_games.all? { |g| g.winner_team_id.present? }

      # Find or initialize the next round game
      next_round_game = Game.find_or_initialize_by(matrix: next_round_game_id)

      # Assign home and away teams based on the dependent games' winners
      if next_round_game.home_team_id.blank?
        next_round_game.home_team_id = dependent_games.first.winner_team_id
      end

      if next_round_game.away_team_id.blank? && dependent_games.count > 1
        next_round_game.away_team_id = dependent_games.second.winner_team_id
      end

      # Save the game if there were any changes
      next_round_game.save if next_round_game.changed?
    end
  end
end
