json.id match.id
json.bracket_id match.bracket_id
json.game_id match.game_id
json.home_team match.game.home_team&.name
json.away_team match.game.away_team&.name
json.pick_team_id match.pick_team&.name
json.winner_team_id match.winner_team&.name
json.created_at match.created_at
json.updated_at match.updated_at