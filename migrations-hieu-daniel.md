# Favorite Movies Challenge
# Setup
<!-- Create a new Rails application called 'favorite_movies'. -->
git checkout -b migrations-hl-dc
rails new favorite_movies -d postgresql -T
cd favorite_movies
<!-- Create the database -->
rails db:create
<!-- Generate a Movie model with a title attribute and a category attribute -->
rails generate model Movie title:string category:string
# Challenges
<!-- Add five entries to the database via the Rails console -->
rails c
Movie.create title:"The Prestige", category:"thriller"
Movie.create title:"Mortal Kombat", category:"action"
Movie.create title:"Corky Romano", category:"comedy"
Movie.create title:"Who Framed Roger Rabbit", category:"mystery"
Movie.create title:"Goodfellas", category:"crime"
<!-- Create a migration to add a new column to the database called movie_length -->
exit out of rails console
rails generate migration add_movie_length_column

class AddMovieLengthColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :movie_length, :integer <-- what was added in our new migration
  end
end

rails db:migrate
<!-- Update the values of the five existing attributes to include a movie_length value -->
the_prestige = Movie.find 1
the_prestige.update movie_length:135
mortal_kombat = Movie.find 2
mortal_kombat.update movie_length:110
corky_romano = Movie.find 3
corky_romano.update movie_length:86
roger_rabbit = Movie.find 4
roger_rabbit.update movie_length:104
goodfellas = Movie.find 5
goodfellas.update movie_length:146
<!-- Generate a migration to rename the column 'category' to 'genre' -->
rails generate migration change_category_to_genre

class ChangeCategoryToGenre < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :category, :genre    <--- what was added in our new migration
  end
end


rails db:migrate



[#<Movie:0x00007fca2f8bd390                                  
  id: 1,                                                     
  title: "The Prestige",                                     
  genre: "thriller",                                         
  created_at: Wed, 31 Aug 2022 19:43:04.954799000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 20:04:26.955006000 UTC +00:00,
  movie_length: 135>,                                        
 #<Movie:0x00007fca2f8bd200                                  
  id: 2,                                                     
  title: "Mortal Kombat",                                    
  genre: "action",                                           
  created_at: Wed, 31 Aug 2022 19:43:48.255617000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 20:05:15.387451000 UTC +00:00,
  movie_length: 110>,
 #<Movie:0x00007fca2f8bd0c0
  id: 3,
  title: "Corky Romano",
  genre: "comedy",
  created_at: Wed, 31 Aug 2022 19:45:13.665888000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 20:05:26.123338000 UTC +00:00,
  movie_length: 86>,
 #<Movie:0x00007fca2f8bcfd0
  id: 4,
  title: "Who Framed Roger Rabbit",
  genre: "mystery",
  created_at: Wed, 31 Aug 2022 19:46:23.256660000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 20:05:37.333393000 UTC +00:00,
  movie_length: 104>,
 #<Movie:0x00007fca2f8bcf08
  id: 5,
  title: "Goodfellas",
  genre: "crime",
  created_at: Wed, 31 Aug 2022 19:48:05.597863000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 20:05:53.724418000 UTC +00:00,
  movie_length: 146>] 