# frozen_string_literal: true

class AddHomePageToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :tmdb_id, :integer
    add_column :movies, :homepage, :string
    rename_column :movies, :movie_image, :poster_path
    rename_column :movies, :running_time, :runtime
  end
end
