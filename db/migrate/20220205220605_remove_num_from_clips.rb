# frozen_string_literal: true

class RemoveNumFromClips < ActiveRecord::Migration[6.1]
  def change
    remove_column :clips, :num, :integer
  end
end
