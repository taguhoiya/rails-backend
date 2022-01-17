# frozen_string_literal: true

class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.integer :num, null: false, default: 0
      t.float :score, null: false, default: 0.0
      t.text :content, null: true
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
