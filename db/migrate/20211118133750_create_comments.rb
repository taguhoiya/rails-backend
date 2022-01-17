# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :num, null: false, default: 0
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :mark, null: false, foreign_key: true
      t.timestamps
    end
  end
end
