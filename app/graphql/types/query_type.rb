# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    add_field(GraphQL::Types::Relay::NodeField)

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :movie, resolver: Resolvers::MovieResolver
    field :movies, resolver: Resolvers::MoviesResolver
    field :movies_all, resolver: Resolvers::MoviesAllResolver
    field :user_image, resolver: Resolvers::UserImageResolver
    field :public_user, resolver: Resolvers::PublicUser
    field :users, resolver: Resolvers::UserAllResolver
    field :mark, resolver: Resolvers::MarkResolver
    field :movie_category, resolver: Resolvers::MovieCategoryResolver
    field :search_movies, Types::SearchMoviesType.connection_type, null: false do
      argument :movie_name, String, required: false
      argument :category, String, required: false
      argument :page, Integer, required: false
      argument :limit, Integer, required: false
    end
    field :search_marks, Types::SearchMarksType.connection_type, null: false do
      argument :page, Integer, required: false
      argument :limit, Integer, required: false
    end

    def search_movies(category:, movie_name:, page: 1, limit: 10)
      # sqlインジェクション用
      search_sql_cate = MovieCategory.sanitize_sql_array(["#{category} = ?", true])

      if !category.empty? && !movie_name.empty?
        categories = MovieCategory.where(search_sql_cate)
        movie_ids = categories.map(&:movie_id)
        Movie.where(id: movie_ids).where('UPPER(movie_name) LIKE ?', "%#{movie_name.upcase}%")
      elsif !category.empty? && movie_name.empty?
        categories = MovieCategory.where(search_sql_cate)
        movie_ids = categories.map(&:movie_id)
        Movie.where(id: movie_ids)
      elsif category.empty? && !movie_name.empty?
        Movie.where('UPPER(movie_name) LIKE ?', "%#{movie_name.upcase}%")
      else
        Movie.all
      end
    end

    def search_marks(page: 1, limit: 10)
      Mark.all
    end
  end
end
