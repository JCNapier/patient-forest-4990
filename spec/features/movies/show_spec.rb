require 'rails_helper'

RSpec.describe 'movie show page' do
 let(:universal) {Studio.create!(name: 'Universal Studios', location: 'Hollywood')}
 let(:movie_1) {universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')}
 let(:movie_2) {universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')}
 let!(:actor_1) {movie_1.actors.create!(name: 'Harrison Ford', age: 78)}
 let!(:actor_2) {movie_1.actors.create!(name: 'Karen Allen', age: 60)}
 let!(:actor_3) {movie_2.actors.create!(name: 'Eddie Murphy', age: 60)}

 it 'can list all movie attributes' do 
    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
 end

 it 'can list all movie actors' do 
    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_2.name)
    expect(actor_2.name).to appear_before(actor_1.name)
    expect(page).to_not have_content(actor_3.name)
 end

 it 'can show the average age of all actors' do
   visit "/movies/#{movie_1.id}"
   
   expect(page).to have_content("Actors Average Age:")
   expect(page).to have_content("69.0")
 end 
end