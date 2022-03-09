# frozen_string_literal: true

class ChangeDataReleaseYearAndReleaseDateToMovie < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :release_year, :string
    change_column :movies, :release_date, :string
  end
end
