class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  validates_presence_of :name, :age 
  
  def self.sorted_by_age 
    order(:age)
  end

  def self.average_age
    average(:age).to_f
  end
end