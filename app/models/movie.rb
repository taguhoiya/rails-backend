# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :clips
  has_many :marks
  has_one :movie_category, dependent: :destroy

  validates :movie_name, presence: true, length: { maximum: 100 }
  validates :summary, length: { maximum: 1000 }
  validates :runtime, numericality: { only_integer: true }
  validates :release_state,
            inclusion: { in: ['Rumored', 'Planned', 'In Production', 'Post Production', 'Released', 'Canceled'],
                         message: '%{value} という値は、無効です。' }
end
