As a developer, I have been tasked with creating a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

Set Up

Create a new Rails app named 'rolodex_challenge'.
$ rails new rolodex -d postgresql -T

Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'
$ rails db:create

Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
>Person.create first_name: "Samuel", last_name: "
Run a migration to set up the database.
Open up Rails console.
Actions

Add five family members into the Person table in the Rails console.
Retrieve all the items in the database.
Add yourself to the Person table.
Retrieve all the entries that have the same last_name as you.
Update the phone number of the last entry in the database.
Retrieve the first_name of the third Person in the database.
Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.
Remove all family members that do not have your last_name.
