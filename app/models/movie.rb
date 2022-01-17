# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :clips
  has_many :marks

  validates :movie_name, presence: true, length: { maximum: 100 }
  validates :summary, length: { maximum: 500 }
  validates :running_time, numericality: { only_integer: true }
  validates :release_year, numericality: { only_integer: true }
  validates :release_state, inclusion: { in: %w[playing closed], message: '%{value} という値は、無効です。' }
  validates :category,
            inclusion: {
              in: %w[non-fiction romance horror war music musical sports SF comedy action adventure documentary suspense thiller
                     fantasy gang mystery history biography human-story], message: '%{value} という値は、無効です。'
            }
end
