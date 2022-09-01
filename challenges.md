As a developer, I have been tasked with creating a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

Set Up

    Create a new Rails app named 'rolodex_challenge'.

    Create the database. The output in the terminal should look like this:

Created database 'rolodex_development'
Created database 'rolodex_test'
    
    Generate a model called Person with a first_name, last_name, and phone. 
    rails generate model Person first_name:string last_name:string phone:string
    
    All fields should be strings.
    
    Run a migration to set up the database.
    $ rails db:migrate
    Open up Rails console.
    rails c
Actions

    Add five family members into the Person table in the Rails console.
    Person.create first_name:"John", last_name:"Smith", phone:"85822005

    Retrieve all the items in the database.
    Person.all
    Add yourself to the Person table.
    done
    Retrieve all the entries that have the same last_name as you.
    Person.where last_name: "Roecker"
    Update the phone number of the last entry in the database.
        newphone = Person.find 5
        newphone.phone = "8675309"
        newphone.save
    Retrieve the first_name of the third Person in the database.
        firstname_finder = Person.find 3
        firstname_finder.first_name
Stretch Challenges

    Update all the family members with the same last_name as you, to have the same phone number as you.
        create a variable
            -phone_changer = Person.where(lastname = "Roecker")
        use .update_all "phone = "8675309" or .update(:all, phone:"8675309")
    Remove all family members that do not have your last_name.
        I screwed this up :()
