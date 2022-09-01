Banking Challenge
Create a new rails application and database

    $ rails new credit_card_challenge_app -d postgresql -T
    $ cd credit_score_app
    $ rails db:create

Setup
# Create a model for owner
        $ rails g model Owner name:string address:string 
        $ rails db:migrate
# add some owners in rails
        $ rails c
        $ Owner.create name:"Bob Marley", address:"420 blaze way"
        $ Owner.create name:"pinochio", address:"666 wooden nose rd"
        $ Owner.create name:"John Daily", address:"626 golf course cr"
#    Create a model for credit card
        A credit card has a number, an expiration date, and an owner
            $ rails g model Card number:integer exp:string owner_id:integer 
            $ rails db:migrate

# An owner has a name and address, and can have multiple credit cards
        in app-model-owner : 
            class Owner < ApplicationRecord
            has_many :cards
            end
        in app-model-card : 
            class Card < ApplicationRecord
            belongs_to :owner
            end
            $ bobby = Owner.fist
            $ bobby.cards.create number:"666555", exp:"54/88"
            $ woody = Owner.find 2
            $ woody.cards.create number:"8675309", exp:"22/99"
            $ bobby.cards.create number:"222555", exp:"51/88"
            johnny = Owner.last
            $ johnny.cards.create number:"42042069", exp:"06/20"
            $ bobby.cards.create number:"2654", exp:"25/88"
            $ bobby.cards.create number:"2255555", exp:"51/98"
            $ bobby.cards <!-- used to check how many cards bobby has -->  
Challenges
 Create three owners and save them in the database
    in rails console. 
    *done*
        
*done* Create a credit card in the database for each owner
*done* Add two more credit cards to one of the owners
Stretch Challenge
Add a credit limit to each card
    $ rails generate migration add_limit_2_cards
       in migrate-new migrate area
        class AddLimit2Cards < ActiveRecord::Migration[7.0]
        def change
            add_column :cards, :limit, :integer
        end
        end
Find the total credit extended to the owner with multiple credit cards
        rails c $ bobby = Owner.first
        rails c $ bobby.cards.sum(:limit)
    *to change one of bob marley card limits
        rails c $ bobby.cards.where(id:3).update limit:4000
    *tested with rails c $ bobby.cards.sum(:limit)
    output:
        

