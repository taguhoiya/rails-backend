# frozen_string_literal: true

class MarkDraft < ApplicationRecord
  belongs_to :movie
  validates :num, :score, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :content, length: { maximum: 500 }
  validates :movie_id, presence: true, uniqueness: { scope: :user_id }
end
