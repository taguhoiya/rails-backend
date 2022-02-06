# frozen_string_literal: true

class RemoveNumFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :num, :integer
  end
end
