# frozen_string_literal: true

class CreateMarkDrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :mark_drafts do |t|
      t.float :score, null: false, default: 0.0
      t.text :content, null: true
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
