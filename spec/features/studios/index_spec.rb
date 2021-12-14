require 'rails_helper'

RSpec.describe 'studio show page' do
 let!(:universal) {Studio.create!(name: 'Universal Studios', location: 'Hollywood')}
 let!(:movie_1) {universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')}
 let!(:movie_2) {universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')}
 let!(:actor_1) {Actor.create!(name: 'Harrison Ford', age: 78)}
 let!(:actor_2) {Actor.create!(name: 'Eddie Murphy', age: 60)}
 let!(:movie_1_actors) {MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)}
 let!(:movie_2_actors) {MovieActor.create!(movie_id: movie_2.id, actor_id: actor_2.id)}

 it 'can show all studios with included movies' do 
  visit "/studios"

  expect(page).to have_content(universal.name)
  expect(page).to have_content(universal.location)
  expect(page).to have_content(movie_1.title)
  expect(page).to have_content(movie_2.title)
  save_and_open_page
 end
end