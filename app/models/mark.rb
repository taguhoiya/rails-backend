# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :movie, optional: true
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :score,
            numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 5.0 },
            presence: true
  validates :content, length: { maximum: 500 }
  validates :movie_id, presence: true, uniqueness: { scope: :user_id }
end
