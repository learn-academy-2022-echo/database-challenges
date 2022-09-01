Setup
Create a new rails application and database

 rails new finance_app -d postgresql -T
 cd finance_app
 rails db:create
 rails server


Create a model for owner
control c out of rails console

rails generate model Owner name:string address:string 
rails db:migrate

An owner has a name and address, and can have multiple credit cards

rails c 
Owner.create name: "John", address: "123 Main Street"
Owner.create name: "Jane", address: "456 Cherry Street"
Owner.create name: "Ray", address: "789 Ash Street"

class Owner < ApplicationRecord
    has_many :card
end

Create a model for credit card

control c out of rails console

rails generate model Card number:string expiration:string owner:string

need to do a migration to add the owner_id instead of owner
exit rails console
rails generate migration remove_owner_column 
 in vscode add appropriate change definition

 save
 
 rails db:migrate

rails generate model Card number:string expiration:string owner_id:integer

A credit card has a number, an expiration date, and an owner
Challenges
Create three owners and save them in the database
John = Owner.first
John.cards.create card: "1234567891234567" expiration: "12/27" owner: "John"
 -- error expecting end of input before expiration

John.card.create card: "1234567891234567"

Create a credit card in the database for each owner
Add two more credit cards to one of the owners
Stretch Challenge
Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards