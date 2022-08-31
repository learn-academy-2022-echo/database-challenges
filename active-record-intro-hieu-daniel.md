# Active Record Intro Challenges

<!-- Create a new Rails app named 'rolodex_challenge'. -->

    rails new rolodex_challenge -d postgresql -T

<!-- Create the database. -->

    cd rolodex_challenge
    rails db:create

<!-- Generate a model called Person with a first_name, last_name, and phone. All fields should be strings. -->

    rails generate model Person first_name:string last_name:string phone:string

<!-- Run a migration to set up the database. -->

    rails db:migrate

<!-- Open up Rails console. -->
    rails c

<!-- Add five family members into the Person table in the Rails console. -->
    Person.create first_name:'Joe', last_name:'Mama', phone:'123-456-7891'
    Person.create first_name:'Wednesday', last_name:'Addams', phone:'1234567892'
    Person.create first_name:'Gomez', last_name:'Addams', phone:'1234567893'
    Person.create first_name:'Morticia', last_name:'Addams', phone:'1234567894'
    Person.create first_name:'Lester', last_name:'Addams', phone:'1234567895' 

<!-- Retrieve all the items in the database. -->
    Person.all

<!-- Add yourself to the Person table. -->
    Person.create first_name:'Daniel', last_name:'Clement', phone:'555-555-5555'

<!-- Retrieve all the entries that have the same last_name as you. -->
    Person.where last_name:'Clement'
<!-- Update the phone number of the last entry in the database. -->
    updated_phone = Person.last
    updated_phone.update phone:'3333333333'
<!-- Retrieve the first_name of the third Person in the database. -->
    third_person = Person.find 3
    third_person.first_name