# frozen_string_literal: true

class CreateClips < ActiveRecord::Migration[6.1]
  def change
    create_table :clips do |t|
      t.integer :num, null: false, default: 0
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
