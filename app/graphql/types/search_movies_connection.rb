# frozen_string_literal: true

module Types
  class SearchMoviesConnection < Types::BaseConnection
    require 'kaminari'
    field :movies, [Types::MovieType], null: false, description: '検索結果'

    def movies
      Kaminari.paginate_array(object.nodes).page(page).per(limit)
    end
  end
end
