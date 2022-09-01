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
$ jungkook.credit_cards.create card_number:987658, expiration_date:'06-2024'
$ jungkook.credit_cards.create card_number:322658, expiration_date:'09-2025'

$ CreditCard.all
    [#<CreditCard:0x00007fc679a112f0
    id: 1,
    card_number: 245986,
    expiration_date: "05-29",
    owner_id: 1,
    created_at:
    Thu, 01 Sep 2022 18:59:59.393348000 UTC +00:00,
    updated_at:
    Thu, 01 Sep 2022 18:59:59.393348000 UTC +00:00>,
    #<CreditCard:0x00007fc679a11228
    id: 2,
    card_number: 215876,
    expiration_date: "06-2034",
    owner_id: 2,
    created_at:
    Thu, 01 Sep 2022 19:01:42.709958000 UTC +00:00,
    updated_at:
    Thu, 01 Sep 2022 19:01:42.709958000 UTC +00:00>,
    #<CreditCard:0x00007fc679a11160
    id: 3,
    card_number: 365845,
    expiration_date: "03-2023",
    owner_id: 3,
    created_at:
    Thu, 01 Sep 2022 19:02:48.746362000 UTC +00:00,
    updated_at:
    Thu, 01 Sep 2022 19:02:48.746362000 UTC +00:00>,
    #<CreditCard:0x00007fc679a11098
    id: 4,
    card_number: 987658,
    expiration_date: "06-2024",
    owner_id: 3,
    created_at:
    Thu, 01 Sep 2022 21:42:52.377599000 UTC +00:00,
    updated_at:
    Thu, 01 Sep 2022 21:42:52.377599000 UTC +00:00>,
    #<CreditCard:0x00007fc679a10fd0
    id: 5,
    card_number: 322658,
    expiration_date: "09-2025",
    owner_id: 3,
    created_at:
    Thu, 01 Sep 2022 21:44:07.775594000 UTC +00:00,
    updated_at:
    Thu, 01 Sep 2022 21:44:07.775594000 UTC +00:00>]

Stretch Challenge
Add a credit limit to each card

$ rails g migration add_column_credit_limit_to_credit_cards
      invoke  active_record
      create    db/migrate/20220901215123_add_column_credit_limit_to_credit_cards.rb

$ rails db:migrate
    == 20220901215123 AddColumnCreditLimitToCreditCards: migrating ================
    -- add_column(:credit_cards, :credit_limit, :float)
    -> 0.0040s
    == 20220901215123 AddColumnCreditLimitToCreditCards: migrated (0.0041s) =======

$ rails g migration change_credit_limit_type_to_integer
      invoke  active_record
      create    db/migrate/20220901220656_change_credit_limit_type_to_integer.rb

$ rails db:migrate
    == 20220901220656 ChangeCreditLimitTypeToInteger: migrating ===================
    -- change_column(:credit_cards, :credit_limit, :integer)
    -> 0.0134s
    == 20220901220656 ChangeCreditLimitTypeToInteger: migrated (0.0136s) ==========

3.0.0 :002 > CreditCard.find(1).update(credit_limit:20000)
  CreditCard Load (1.1ms)  SELECT "credit_cards".* FROM "credit_cards" WHERE "credit_cards"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  TRANSACTION (25.0ms)  BEGIN
  Owner Load (0.5ms)  SELECT "owners".* FROM "owners" WHERE "owners"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  CreditCard Update (0.5ms)  UPDATE "credit_cards" SET "updated_at" = $1, "credit_limit" = $2 WHERE "credit_cards"."id" = $3  [["updated_at", "2022-09-01 22:13:05.712106"], ["credit_limit", 20000], ["id", 1]]
  TRANSACTION (3.2ms)  COMMIT
 => true
3.0.0 :003 > CreditCard.find(2).update(credit_limit:90000)
  CreditCard Load (13.7ms)  SELECT "credit_cards".* FROM "credit_cards" WHERE "credit_cards"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
  TRANSACTION (0.2ms)  BEGIN
  Owner Load (0.4ms)  SELECT "owners".* FROM "owners" WHERE "owners"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
  CreditCard Update (0.4ms)  UPDATE "credit_cards" SET "updated_at" = $1, "credit_limit" = $2 WHERE "credit_cards"."id" = $3  [["updated_at", "2022-09-01 22:14:01.705774"], ["credit_limit", 90000], ["id", 2]]
  TRANSACTION (0.8ms)  COMMIT
 => true
3.0.0 :004 > CreditCard.find(3).update(credit_limit:1000000)
  CreditCard Load (15.4ms)  SELECT "credit_cards".* FROM "credit_cards" WHERE "credit_cards"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
  TRANSACTION (0.2ms)  BEGIN
  Owner Load (0.4ms)  SELECT "owners".* FROM "owners" WHERE "owners"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
  CreditCard Update (0.6ms)  UPDATE "credit_cards" SET "updated_at" = $1, "credit_limit" = $2 WHERE "credit_cards"."id" = $3  [["updated_at", "2022-09-01 22:14:43.855095"], ["credit_limit", 1000000], ["id", 3]]
  TRANSACTION (0.9ms)  COMMIT
 => true
3.0.0 :005 > CreditCard.find(4).update(credit_limit:548679520)
  CreditCard Load (0.5ms)  SELECT "credit_cards".* FROM "credit_cards" WHERE "credit_cards"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]
  TRANSACTION (0.2ms)  BEGIN
  Owner Load (0.4ms)  SELECT "owners".* FROM "owners" WHERE "owners"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
  CreditCard Update (0.6ms)  UPDATE "credit_cards" SET "updated_at" = $1, "credit_limit" = $2 WHERE "credit_cards"."id" = $3  [["updated_at", "2022-09-01 22:15:29.804770"], ["credit_limit", 548679520], ["id", 4]]
  TRANSACTION (0.9ms)  COMMIT
 => true
3.0.0 :006 > CreditCard.find(5).update(credit_limit:8475962)
  CreditCard Load (0.6ms)  SELECT "credit_cards".* FROM "credit_cards" WHERE "credit_cards"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
  TRANSACTION (0.2ms)  BEGIN
  Owner Load (0.4ms)  SELECT "owners".* FROM "owners" WHERE "owners"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
  CreditCard Update (0.5ms)  UPDATE "credit_cards" SET "updated_at" = $1, "credit_limit" = $2 WHERE "credit_cards"."id" = $3  [["updated_at", "2022-09-01 22:17:39.212246"], ["credit_limit", 8475962], ["id", 5]]
  TRANSACTION (0.6ms)  COMMIT


Find the total credit extended to the owner with multiple credit cards

$ jungkook_cards = CreditCard.where owner_id:3
$ jungkook_cards
    [#<CreditCard:0x00007fbb01f4f358
    id: 3,
    card_number: 365845,
    expiration_date: "03-2023",
    owner_id: 3,
    created_at: Thu, 01 Sep 2022 19:02:48.746362000 UTC +00:00,
    updated_at: Thu, 01 Sep 2022 22:14:43.855095000 UTC +00:00,
    credit_limit: 1000000>,
    #<CreditCard:0x00007fbb01f4f290
    id: 4,
    card_number: 987658,
    expiration_date: "06-2024",
    owner_id: 3,
    created_at: Thu, 01 Sep 2022 21:42:52.377599000 UTC +00:00,
    updated_at: Thu, 01 Sep 2022 22:15:29.804770000 UTC +00:00,
    credit_limit: 548679520>,
    #<CreditCard:0x00007fbb01f4c158
    id: 5,
    card_number: 322658,
    expiration_date: "09-2025",
    owner_id: 3,
    created_at: Thu, 01 Sep 2022 21:44:07.775594000 UTC +00:00,
    updated_at: Thu, 01 Sep 2022 22:17:39.212246000 UTC +00:00,
    credit_limit: 8475962>]

PSEUDO CODE:
- declare a method that takes in an array of hashes
- iterate through array using each method
- access credit_limit in hash
- have a variable equal to 0, adding credit_limit to it with each iteration

```ruby
def add_limits array
    total_limit = 0
    array.each do |value|
        total_limit += value.credit_limit
    end
    p total_limit
end
```
$ add_limits jungkook_cards
    558155482
    => 558155482
