class MoviesController < ApplicationController 
  def show 
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.sorted_by_age
    @age = @movie.actors.average_age
  end
end