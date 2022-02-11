# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :mark
  belongs_to :user

  validates :mark_id, presence: true, uniqueness: { scope: :user_id }
end
