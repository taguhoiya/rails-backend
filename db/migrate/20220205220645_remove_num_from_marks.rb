# frozen_string_literal: true

class RemoveNumFromMarks < ActiveRecord::Migration[6.1]
  def change
    remove_column :marks, :num, :integer
  end
end
