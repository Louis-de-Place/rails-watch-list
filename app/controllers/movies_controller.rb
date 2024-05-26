class MoviesController < ApplicationController
  def index
    @movies_lists = Movie.all.group_by(&:list_type)
  end

  def list
    @list_type = params[:list_type]
    @movies = Movie.where(list_type: @list_type)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
