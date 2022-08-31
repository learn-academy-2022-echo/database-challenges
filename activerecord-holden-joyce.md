Set Up
Create a new Rails app named 'rolodex_challenge'.

$rails new rolodex_challenge -d postgresql -T 
cd rolodex_challenge
$rails db:create 

Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'

our output: 
Created database 'rolodex_challenge_development'
Created database 'rolodex_challenge_test'

$rails server

Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.

$rails generate model Person first_name:string last_name:string phone:string

our output: 
invoke  active_record
      create    db/migrate/20220831184311_create_people.rb
      create    app/models/person.rb

Run a migration to set up the database.

$rails db:migrate

our output: 
== 20220831184311 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0399s
== 20220831184311 CreatePeople: migrated (0.0400s) ============================

Open up Rails console

rails console || rails c 

Actions

Add five family members into the Person table in the Rails console.
Retrieve all the items in the database.

<!-- $rails generate model Person first_name:string last_name:string phone:string -->

$Person.create first_name:'Holden', last_name:'Prine', phone:'123-456-7890'

    output: [["first_name", "Holden"], ["last_name", "Prine"], ["phone", "123-456-7890"], ["created_at", "2022-08-31 18:50:17.847073"], ["updated_at", "2022-08-31 18:50:17.847073"]]
  TRANSACTION (3.6ms)  COMMIT
 => 
        #<Person:0x00007fc18a13f0f8
        id: 1,
        first_name: "Holden",
        last_name: "Prine",
        phone: "123-456-7890",
        created_at: Wed, 31 Aug 2022 18:50:17.847073000 UTC +00:00,
        updated_at: Wed, 31 Aug 2022 18:50:17.847073000 UTC +00:00> 
        3.0.0 :002 > 

$Person.create first_name:'Joyce', last_name:'Magistrado', phone:'098-765-4321'

    output: 
            [["first_name", "Joyce"], ["last_name", "Magistrado"], ["phone", "098-765-4321"], ["created_at", "2022-08-31 18:52:11.643768"], ["updated_at", "2022-08-31 18:52:11.643768"]]
        TRANSACTION (4.8ms)  COMMIT
        => 
                #<Person:0x00007fc18a265e28
                id: 2,
                first_name: "Joyce",
                last_name: "Magistrado",
                phone: "098-765-4321",
                created_at: Wed, 31 Aug 2022 18:52:11.643768000 UTC +00:00,
                updated_at: Wed, 31 Aug 2022 18:52:11.643768000 UTC +00:00> 
                3.0.0 :003 > 

$Person.create first_name:'Mango', last_name:'Cat', phone:'111-111-1111'

    output: 
            [["first_name", "Mango"], ["last_name", "Cat"], ["phone", "111-111-1111"], ["created_at", "2022-08-31 18:54:16.859177"], ["updated_at", "2022-08-31 18:54:16.859177"]]
            TRANSACTION (3.4ms)  COMMIT
            => 
            #<Person:0x00007fc18454b1e8
            id: 3,
            first_name: "Mango",
            last_name: "Cat",
            phone: "111-111-1111",
            created_at: Wed, 31 Aug 2022 18:54:16.859177000 UTC +00:00,
            updated_at: Wed, 31 Aug 2022 18:54:16.859177000 UTC +00:00> 

$Person.create first_name:'Precious', last_name:'Dog', phone:'777-777-7777'

    output: 
            [["first_name", "Precious"], ["last_name", "Dog"], ["phone", "777-777-7777"], ["created_at", "2022-08-31 18:55:15.839892"], ["updated_at", "2022-08-31 18:55:15.839892"]]
        TRANSACTION (3.6ms)  COMMIT
            => 
            #<Person:0x00007fc18a1bce18
            id: 4,
            first_name: "Precious",
            last_name: "Dog",
            phone: "777-777-7777",
            created_at: Wed, 31 Aug 2022 18:55:15.839892000 UTC +00:00,
            updated_at: Wed, 31 Aug 2022 18:55:15.839892000 UTC +00:00> 
        

$Person.create first_name:'Mochi', last_name:'fish', phone:'888-888-8888'

    output: 
            [["first_name", "Mochi"], ["last_name", "fish"], ["phone", "888-888-8888"], ["created_at", "2022-08-31 18:57:24.800338"], ["updated_at", "2022-08-31 18:57:24.800338"]]
        TRANSACTION (0.7ms)  COMMIT
        => 
        #<Person:0x00007fc18a26f270
        id: 5,
        first_name: "Mochi",
        last_name: "fish",
        phone: "888-888-8888",
        created_at: Wed, 31 Aug 2022 18:57:24.800338000 UTC +00:00,
        updated_at: Wed, 31 Aug 2022 18:57:24.800338000 UTC +00:00> 

        

Add yourself to the Person table.
Retrieve all the entries that have the same last_name as you.
Update the phone number of the last entry in the database.
Retrieve the first_name of the third Person in the database.
Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.