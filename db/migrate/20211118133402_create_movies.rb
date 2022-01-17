# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :movie_name, null: false
      t.string :movie_image, null: true
      t.text :summary, null: true
      t.integer :running_time, null: false, default: 0
      t.integer :release_year, null: true
      t.date :release_date, null: true
      t.string :country, null: true
      t.string :category, null: true
      t.string :release_state, null: false
      t.timestamps
    end
  end
end
