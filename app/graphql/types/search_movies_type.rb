# frozen_string_literal: true

module Types
  class SearchMoviesType < Types::BaseObject
    class << self
      def connection_type_class
        @connection_type_class ||= Types::SearchMoviesConnection
      end
    end
  end
end
