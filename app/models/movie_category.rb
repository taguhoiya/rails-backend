# frozen_string_literal: true

class MovieCategory < ApplicationRecord
  belongs_to :movie
end
