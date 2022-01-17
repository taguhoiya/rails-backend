# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :num, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :mark, null: false, foreign_key: true
      t.timestamps
    end
  end
end
