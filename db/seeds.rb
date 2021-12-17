genres = ['Action/Adventure', 'Drama', 'Comedy', 'Romance']

universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
Studio.create!(name: 'Lionsgate', location: 'Hollywood')
Studio.create!(name: 'Carmer Studios', location: 'Denver')
Studio.create!(name: 'Napier Studios', location: 'Ft. Collins')

movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
movie_2 = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

actor_1 = Actor.create!(name: 'Harrison Ford', age: 78)
actor_2 = Actor.create!(name: 'Eddie Murphy', age: 60)

10.times do |i|
  Actor.create!(name: "Actor ##{i}")
end

all_actor_ids = Actor.all.pluck(:id)

MovieActors.create!(movie: movie_1, actor: actor_1)
MovieActors.create!(movie: movie_2, actor: actor_2)

Studio.all.each do |studio|
  # create 100 movies for each studio
  100.times do |i|
    movie = studio.movies.create!(title: "#{studio.name} Movie Title #{i}", creation_year: rand(1980...2021), genre: genres.sample)

    #add 2 actors for each movie
    2.times do
      random_actor_id = all_actor_ids.sample
      random_actor = Actor.find(random_actor_id)
      movie.actors <<  random_actor
      movie.save
    end
  end
end