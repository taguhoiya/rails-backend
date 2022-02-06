# frozen_string_literal: true

class RemoveNumFromMarkDrafts < ActiveRecord::Migration[6.1]
  def change
    remove_column :mark_drafts, :num, :integer
  end
end
