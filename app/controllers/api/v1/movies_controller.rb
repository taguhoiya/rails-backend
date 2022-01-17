# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show destroy update]

      def index
        movies = Movie.all.order(:id)
        render json: movies
      end

      def show
        render json: @movie
      end

      def create
        movie = Movie.new(movie_params)
        if movie.save!
          render json: movie
        else
          render json: movie.errors
        end
      end

      def update
        if @movie.update(movie_params)
          render json: @movie
        else
          render json: @movie.errors
        end
      end

      def destroy
        if @movie.destroy
          render json: @movie
        else
          render json: @movie.errors
        end
      end

      private

      def set_movie
        @movie = Moive.find(params[:id])
      end

      def movie_params
        params.require(:movie).permit(:title, :content)
      end
    end
  end
end
