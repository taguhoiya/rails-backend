# frozen_string_literal: true

module Types
  class SearchMarksConnection < Types::BaseConnection
    require 'kaminari'
    field :marks, [Types::MarkType], null: false, description: '検索結果'

    def marks
      Kaminari.paginate_array(object.nodes).page(page).per(limit)
    end
  end
end
