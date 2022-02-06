# frozen_string_literal: true

class RemoveFavoIdFromNoti < ActiveRecord::Migration[6.1]
  def change
    remove_column :notifications, :favorite_id, :integer
  end
end
