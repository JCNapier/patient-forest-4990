require 'rails_helper'

RSpec.describe Actor, type: :model do
 let(:universal) {Studio.create!(name: 'Universal Studios', location: 'Hollywood')}
 let(:movie_1) {universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')}
 let(:movie_2) {universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')}
 let!(:actor_1) {movie_1.actors.create!(name: 'Harrison Ford', age: 78)}
 let!(:actor_2) {movie_1.actors.create!(name: 'Karen Allen', age: 60)}
 let!(:actor_3) {movie_2.actors.create!(name: 'Eddie Murphy', age: 60)}
  
 describe 'relationships' do 
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'validations' do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
  end

  describe 'active record methods' do 
    it 'can sort actors by age' do 
      expect(movie_1.actors.sorted_by_age).to eq([actor_2, actor_1])
    end

    it 'can average all actors age' do 
      expect(movie_1.actors.average_age).to eq(69.0)
    end
  end
end