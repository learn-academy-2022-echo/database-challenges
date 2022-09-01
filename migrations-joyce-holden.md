## Setup

Create a new Rails application called 'favorite_movies'.
$ rails new favorite_movies -d postgresql -T

Create the database
Created database 'favorite_movies_development'
Created database 'favorite_movies_test'

Generate a Movie model with a title attribute and a category attribute
 invoke  active_record
      create    db/migrate/20220831224306_create_movies.rb
      create    app/models/movie.rb

## Challenges

Add five entries to the database via the Rails console
1.
 TRANSACTION (0.2ms)  BEGIN
  Movie Create (1.5ms)  INSERT INTO "movies" ("title", "category", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["title", "Harry Potter"], ["category", "fantasy"], ["created_at", "2022-08-31 22:52:08.038150"], ["updated_at", "2022-08-31 22:52:08.038150"]]                                                        
  TRANSACTION (24.2ms)  COMMIT                                   
 =>                                                              
#<Movie:0x00007fece8b0cc78                                       
 id: 1,                                                          
 title: "Harry Potter",                                          
 category: "fantasy",                                            
 created_at: Wed, 31 Aug 2022 22:52:08.038150000 UTC +00:00,     
 updated_at: Wed, 31 Aug 2022 22:52:08.038150000 UTC +00:00> 
 
Create a migration to add a new column to the database called movie_length
Update the values of the five existing attributes to include a movie_length value
Generate a migration to rename the column 'category' to 'genre'