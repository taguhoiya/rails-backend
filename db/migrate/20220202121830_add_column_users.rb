# frozen_string_literal: true

class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :self_intro, :text
  end
end
