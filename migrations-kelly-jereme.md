<!-- Create a new Rails application called 'favorite_movies'. -->
In terminal

new favorite_movies -d postgresql -T
<!--  -->







<!-- Create the database -->
In terminal 

rails db:create
    Created database 'favorite_movies_development'
    Created database 'favorite_movies_test'
<!--  -->






<!-- Generate a Movie model with a title attribute and a category attribute -->
In terminal 

 rails g model Movie title:string category:string 
      invoke  active_record
      create    db/migrate/20220831223414_create_movies.rb
      create    app/models/movie.rb
<!--  -->










In terminal 

rails db:migrate
== 20220831223414 CreateMovies: migrating =====================================
-- create_table(:movies)
   -> 0.0334s
== 20220831223414 CreateMovies: migrated (0.0335s) ============================









<!-- Add five entries to the database via the Rails console -->

In Rails console

Movie.create title:'Nope', category:'Horror and Thriller'

Movie.create title:'The Black Phone', category:'Thriller'
 
Movie.create title:'Big Hero 6', category:'Action and Animation'

Movie.create title:'The Little Mermaid', category:'Family and Animation'

Movie.create title:'Avengers: End Game', category:'Action'
<!--  -->












In Rails console

 Movie.all
```Movie List; Uncollapse hit the ' > ' 
  Movie Load (3.5ms)  SELECT "movies".* FROM "movies"
 =>                                                          
[#<Movie:0x00007f798fcd5310                                  
  id: 1,                                                     
  title: "Nope",                                             
  category: "Horror and Thriller",                           
  created_at: Wed, 31 Aug 2022 22:39:30.839882000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:39:30.839882000 UTC +00:00>,
 #<Movie:0x00007f798fcd51d0                                  
  id: 2,                                                     
  title: "The Black Phone",                                  
  category: "Thriller",                                      
  created_at: Wed, 31 Aug 2022 22:40:48.909336000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:40:48.909336000 UTC +00:00>,
 #<Movie:0x00007f798fcd5108                                  
  id: 3,
  title: "Big Hero 6",
  category: "Action and Animation",
  created_at: Wed, 31 Aug 2022 22:41:33.618874000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:41:33.618874000 UTC +00:00>,
 #<Movie:0x00007f798fcd5040
  id: 4,
  title: "The Little Mermaid",
  category: "Family and Animation",
  created_at: Wed, 31 Aug 2022 22:42:34.118964000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:42:34.118964000 UTC +00:00>,
 #<Movie:0x00007f798fcd4f78
  id: 5,
  title: "Avengers: End Game",
  category: "Action",
  created_at: Wed, 31 Aug 2022 22:43:19.012979000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:43:19.012979000 UTC +00:00>] 
```











<!-- Create a migration to add a new column to the database called movie_length -->

In terminal

rails g migration add_columns_movie_length_to_movies
      invoke  active_record
      create    db/migrate/20220901000151_add_columns_movie_length_to_movies.rb

<!--    We now head into the rails folder: favorite_movies -> db -> migrate -> correct file  -->

In terminal within the Rails App

Within the correect file:

class AddColumnsMovieLengthToMovies < ActiveRecord::Migration[7.0]
  def change
  end
end

Update the migration file. Migrations can take in special methods few listed ins syllabus: add_column, change_column, rename_column, remove_column, ... 

Since we want to add a column use -> add_column; the final outcome should be this


class AddColumnsMovieLengthToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :movie_length, :string
  end
end


Once changes are made:

In terminal

rails db:migrate
== 20220901000151 AddColumnsMovieLengthToMovies: migrating ====================
-- add_column(:movies, :movie_length, :string)
   -> 0.0086s
== 20220901000151 AddColumnsMovieLengthToMovies: migrated (0.0086s) ===========

rails c

In Rails console

 Movie.all
```Nil movie_length collapesed code click on ' > ' to uncollapse
    Movie Load (0.9ms)  SELECT "movies".* FROM "movies"
 =>                                                          
[#<Movie:0x00007fdb34d10080                                  
  id: 1,                                                     
  title: "Nope",                                             
  category: "Horror and Thriller",                           
  created_at: Wed, 31 Aug 2022 22:39:30.839882000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:39:30.839882000 UTC +00:00,
  movie_length: nil>,                                        
 #<Movie:0x00007fdb3581de78                                  
  id: 2,                                                     
  title: "The Black Phone",                                  
  category: "Thriller",                                      
  created_at: Wed, 31 Aug 2022 22:40:48.909336000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:40:48.909336000 UTC +00:00,
  movie_length: nil>,
 #<Movie:0x00007fdb3581ddb0
  id: 3,
  title: "Big Hero 6",
  category: "Action and Animation",
  created_at: Wed, 31 Aug 2022 22:41:33.618874000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:41:33.618874000 UTC +00:00,
  movie_length: nil>,
 #<Movie:0x00007fdb3581dce8
  id: 4,
  title: "The Little Mermaid",
  category: "Family and Animation",
  created_at: Wed, 31 Aug 2022 22:42:34.118964000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:42:34.118964000 UTC +00:00,
  movie_length: nil>,
 #<Movie:0x00007fdb3581dc20
  id: 5,
  title: "Avengers: End Game",
  category: "Action",
  created_at: Wed, 31 Aug 2022 22:43:19.012979000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:43:19.012979000 UTC +00:00,
  movie_length: nil>] 
```


movie_length1 = Movie.find 1
movie_length1.update movie_length:'2 Hours, 15 Mins'

movie_length2 = Movie.find 2
movie_length2.update movie_length:'1 Hour, 42 Mins'

movie_length3 = Movie.find 3
movie_length3.update movie_length:'1 Hour, 42 Mins'
    
movie_length4 = Movie.find 4
movie_length4.update movie_length:'1 Hour, 23 Mins'

movie_length5 = Movie.find 5
movie_length5.update movie_length:'3 Hours, 2 Mins'

 Movie.all
  ```Movie List with Updated movie_length collapesed code click on ' > ' to uncollapse
Movie Load (0.8ms)  SELECT "movies".* FROM "movies"
 =>                                                          
[#<Movie:0x00007fdb311c3a40                                  
  id: 1,                                                     
  title: "Nope",                                             
  category: "Horror and Thriller",                           
  created_at: Wed, 31 Aug 2022 22:39:30.839882000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:21:08.951081000 UTC +00:00,
  movie_length: "2 Hours, 15 Mins">,                         
 #<Movie:0x00007fdb311c34f0                                  
  id: 2,                                                     
  title: "The Black Phone",                                  
  category: "Thriller",                                      
  created_at: Wed, 31 Aug 2022 22:40:48.909336000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:58.338108000 UTC +00:00,
  movie_length: "1 Hour, 42 Mins">,
 #<Movie:0x00007fdb311c2ff0
  id: 3,
  title: "Big Hero 6",
  category: "Action and Animation",
  created_at: Wed, 31 Aug 2022 22:41:33.618874000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:58.392303000 UTC +00:00,
  movie_length: "1 Hour, 42 Mins">,
 #<Movie:0x00007fdb311c29d8
  id: 4,
  title: "The Little Mermaid",
  category: "Family and Animation",
  created_at: Wed, 31 Aug 2022 22:42:34.118964000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:58.434503000 UTC +00:00,
  movie_length: "1 Hour, 23 Mins">,
 #<Movie:0x00007fdb311c2578
  id: 5,
  title: "Avengers: End Game",
  category: "Action",
  created_at: Wed, 31 Aug 2022 22:43:19.012979000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:59.926060000 UTC +00:00,
  movie_length: "3 Hours, 2 Mins">] 

```

<!--  -->









exit 

<!-- Generate a migration to rename the column 'category' to 'genre' -->
In terminal 

rails g migration changing_category_to_genre
      invoke  active_record
      create    db/migrate/20220901004841_changing_category_to_genre.rb


Manually Modify the changing_category_to_genre migration file (in the rails file: favorite movies) to our desired method: rename_column :table, :old_column, :new_column

Old
```Old Code in migrate folder
class ChangingCategoryToGenre < ActiveRecord::Migration[7.0]
  def change
  end
end
```
New
```New Code in migrate folder
class ChangingCategoryToGenre < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :category, :genre
  end
end
```

rails db:migrate
== 20220901004841 ChangingCategoryToGenre: migrating ==========================
-- rename_column(:movies, :category, :genre)
   -> 0.0128s
== 20220901004841 ChangingCategoryToGenre: migrated (0.0129s) =================


rails c

In Rails console

Movie.all
```Changed the column category to genre
  Movie Load (0.7ms)  SELECT "movies".* FROM "movies"
 =>                                                          
[#<Movie:0x00007f7805a35320                                  
  id: 1,                                                     
  title: "Nope",                                             
  genre: "Horror and Thriller",                              
  created_at: Wed, 31 Aug 2022 22:39:30.839882000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:21:08.951081000 UTC +00:00,
  movie_length: "2 Hours, 15 Mins">,                         
 #<Movie:0x00007f78023044f0                                  
  id: 2,                                                     
  title: "The Black Phone",                                  
  genre: "Thriller",                                         
  created_at: Wed, 31 Aug 2022 22:40:48.909336000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:58.338108000 UTC +00:00,
  movie_length: "1 Hour, 42 Mins">,
 #<Movie:0x00007f7802304338
  id: 3,
  title: "Big Hero 6",
  genre: "Action and Animation",
  created_at: Wed, 31 Aug 2022 22:41:33.618874000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:58.392303000 UTC +00:00,
  movie_length: "1 Hour, 42 Mins">,
 #<Movie:0x00007f78022efe60
  id: 4,
  title: "The Little Mermaid",
  genre: "Family and Animation",
  created_at: Wed, 31 Aug 2022 22:42:34.118964000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:58.434503000 UTC +00:00,
  movie_length: "1 Hour, 23 Mins">,
 #<Movie:0x00007f78022efc58
  id: 5,
  title: "Avengers: End Game",
  genre: "Action",
  created_at: Wed, 31 Aug 2022 22:43:19.012979000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 00:39:59.926060000 UTC +00:00,
  movie_length: "3 Hours, 2 Mins">] 
```









