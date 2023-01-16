json.extract! game, :id, :artworks, :name, :platforms, :release_dates, :screenshots, :summary, :genre, :total_rating, :created_at, :updated_at
json.url game_url(game, format: :json)
