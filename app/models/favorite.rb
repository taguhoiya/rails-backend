# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :mark
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :mark_id, presence: true, uniqueness: { scope: :user_id }
end
