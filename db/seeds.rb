universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
movie_2 = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

actor_1 = Actor.create!(name: 'Harrison Ford', age: 78)
actor_2 = Actor.create!(name: 'Eddie Murphy', age: 60)

movie_1_actors = MovieActors.create!(movie: movie_1, actor: actor_1)
movie_2_actors = MovieActors.create!(movie: movie_2, actor: actor_2)