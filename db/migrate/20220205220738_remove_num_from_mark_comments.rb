# frozen_string_literal: true

class RemoveNumFromMarkComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :num, :integer
  end
end
