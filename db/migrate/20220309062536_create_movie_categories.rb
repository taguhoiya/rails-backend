# frozen_string_literal: true

class CreateMovieCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_categories do |t|
      t.references :movie, null: false, foreign_key: true
      t.boolean :action, default: false, null: false
      t.boolean :adventure, default: false, null: false
      t.boolean :animation, default: false, null: false
      t.boolean :comedy, default: false, null: false
      t.boolean :crime, default: false, null: false
      t.boolean :documentary, default: false, null: false
      t.boolean :drama, default: false, null: false
      t.boolean :family, default: false, null: false
      t.boolean :fantasy, default: false, null: false
      t.boolean :history, default: false, null: false
      t.boolean :horror, default: false, null: false
      t.boolean :music, default: false, null: false
      t.boolean :mystery, default: false, null: false
      t.boolean :romance, default: false, null: false
      t.boolean :science_fiction, default: false, null: false
      t.boolean :tv_movie, default: false, null: false
      t.boolean :thriller, default: false, null: false
      t.boolean :war, default: false, null: false
      t.boolean :western, default: false, null: false
      t.timestamps
    end
  end
end
