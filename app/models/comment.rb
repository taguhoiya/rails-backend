# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :mark
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :content, length: { maximum: 500 }
end
