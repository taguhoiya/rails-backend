# frozen_string_literal: true

module Types
  class BaseConnection < GraphQL::Types::Relay::BaseConnection
    # include GraphQL::Types::Relay::ConnectionBehaviors
    field :total_count, Int, null: false, description: '総件数'
    def total_count
      object.nodes.size
    end

    field :total_page, Int, null: false, description: '総ページ数'
    def total_page
      (total_count.to_f / limit).ceil
    end

    field :now_page, Int, null: false, description: '現在のページ'
    def now_page
      page
    end

    protected

    def page
      object.arguments[:page] || 1
    end

    def limit
      object.arguments[:limit] || 10
    end
  end
end
