<!-- BANK CHALLENGE -->
<!-- Create a new rails application and database -->

    rails new bank -d postgresql -T
    cd bank
    rails db:create
    rails server
    create new terminal
  

<!-- Create a model for owner -->
    rails g model Owner 

<!-- An owner has a name and address, and can have multiple credit cards -->
    rails g model Owner name:string address:string
    rails db:migrate


<!-- Create a model for credit card -->
    rails g model Card

<!-- A credit card has a number, an expiration date, and an owner -->
    rails g model Card card_num:integer exp_date:integer owner:string
    rails db:migrate

<!-- Challenges -->
<!-- Create three owners and save them in the database -->
    make sure rails console is refeshed or open a new one
    Owner.create name: "Joe", address: "124 Dolly lane"
    Owner.create name: "Moe", address: "125 Dolly lane"
    Owner.create name: "Zoe", address: "126 Dolly lane"

<!-- Create a credit card in the database for each owner -->
    edited the app/models/card.rb and added belongs_to :owner
    edited the app/model/owner.rb and added has_many :cards

    Card.create card_num: 123456789, exp_date: 20221031
    Card.create card_num: 223456789, exp_date: 20221031
    Card.create card_num: 323456789, exp_date: 20221031

<!-- this doesn't work, no method error -->
    joe.cards.create card_num:147258369, exp_date: 20221031


<!-- Add two more credit cards to one of the owners -->


Stretch Challenge
Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards