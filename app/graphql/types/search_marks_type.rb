# frozen_string_literal: true

module Types
  class SearchMarksType < Types::BaseObject
    class << self
      def connection_type_class
        @connection_type_class ||= Types::SearchMarksConnection
      end
    end
  end
end
