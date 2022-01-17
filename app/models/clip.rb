# frozen_string_literal: true

class Clip < ApplicationRecord
  belongs_to :movie, optional: true
  belongs_to :user, optional: true
  validates :num, numericality: { only_integer: true }
  validates :movie_id, presence: true, uniqueness: { scope: :user_id }
end
