class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  validates_presence_of :title, :creation_year, :genre, :studio_id
end
