Setup
## Create a new Rails application called 'favorite_movies'.

>>rails new favorite_movie -d postgresql -T
>>cd favorite_movie
>>rails db:create
>>rails s

## Create the database
>>rails g model Movie title:'string' category:'string'
>>rails c
>>rails db:migrate

## Generate a Movie model with a title attribute and a category attribute

>>rails g migration add_column_movie_length
>>rails db:migrate

## Challenges
## Add five entries to the database via the Rails console

>>
Movie.create title:'Tremors', category:'Thriller'

[#<Movie:0x00007f7f4640dc70     
  id: 1,        
  title: "Tremors",  
  category: "Thriller",   
  created_at: Wed, 31 Aug 2022 22:41:05.436247000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:41:05.436247000 UTC +00:00>,
 #<Movie:0x00007f7f4640db30   
  id: 2,                    
  title: "Dragon Ball",                                      
  category: "action",     
  created_at: Wed, 31 Aug 2022 22:43:54.932343000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:43:54.932343000 UTC +00:00>,
 #<Movie:0x00007f7f4640da40   
  id: 3,
  title: "The Avengers",
  category: "action",
  created_at: Wed, 31 Aug 2022 22:44:27.935972000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:44:27.935972000 UTC +00:00>,
 #<Movie:0x00007f7f4640d978
  id: 4,
  title: "Minions",
  category: "comedy",
  created_at: Wed, 31 Aug 2022 22:45:18.340216000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:45:18.340216000 UTC +00:00>,
 #<Movie:0x00007f7f4640d8b0
  id: 5,
  title: "Deadpool",
  category: "action/comedy",
  created_at: Wed, 31 Aug 2022 22:46:05.252977000 UTC +00:00,
  updated_at: Wed, 31 Aug 2022 22:46:05.252977000 UTC +00:00>] 

## Create a migration to add a new column to the database called movie_length

>>rails g migration add_column_movie_length
>> on new migrate file, insert:
add_column :movies, :movie_length, :string
>>rails db:migrate

## Update the values of the five existing attributes to include a movie_length value

## Generate a migration to rename the column 'category' to 'genre'