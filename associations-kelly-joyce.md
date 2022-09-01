Setup

Create a new rails application and database

$ rails new banking_app -d postgresql -T
$ rails db:create
    Created database 'banking_app_development'
    Created database 'banking_app_test'

$ rails db:migrate


Create a model for owner
An owner has a name and address, and can have multiple credit cards

$ rails g model Owner
      invoke  active_record
      create    db/migrate/20220901182638_create_owners.rb
      create    app/models/owner.rb


Create a model for credit card
A credit card has a number, an expiration date, and an owner

$ rails g model CreditCard card_number:integer expiration_date:string owner_id:integer
      invoke  active_record
      create    db/migrate/20220901183409_create_credit_cards.rb
      create    app/models/credit_card.rb


Challenges
Create three owners and save them in the database

$ Owner.create ...
$ Owner.all
    [#<Owner:0x00007f9f38e39020
    id: 1,
    name: "Joyce",
    address: "1235 Coffee Dr",
    created_at: Thu, 01 Sep 2022 18:31:38.483167000 UTC +00:00,
    updated_at: Thu, 01 Sep 2022 18:31:38.483167000 UTC +00:00>,
    #<Owner:0x00007f9f38e38ee0
    id: 2,
    name: "Kelly",
    address: "0613 BTS Blvd",
    created_at: Thu, 01 Sep 2022 18:38:40.636308000 UTC +00:00,
    updated_at: Thu, 01 Sep 2022 18:38:40.636308000 UTC +00:00>,
    #<Owner:0x00007f9f38e38e18
    id: 3,
    name: "Jungkook",
    address: "0901 Kookie Rd",
    created_at: Thu, 01 Sep 2022 18:39:46.676986000 UTC +00:00,
    updated_at: Thu, 01 Sep 2022 18:39:46.676986000 UTC +00:00>]

Create a credit card in the database for each owner
$ joyce = Owner.first
$ joyce.credit_cards.create card_number: 245986, expiration_date:'05-29'

$ kelly = Owner.find 2
$ kelly.credit_cards.create card_number:215876, expiration_date:'06-2034'

$ jungkook = Owner.find 3
$ jungkook.credit_cards.create card_number:365845, expiration_date:'03-2023'

Add two more credit cards to one of the owners


Stretch Challenge
Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards
