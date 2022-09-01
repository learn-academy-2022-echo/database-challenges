## Banking Challenge
## Setup
## Create a new rails application and database
>>Code:
    >rails new bank_app -d postgresql -T
    >cd bank_app
    >rails db:create
    >rails server

## Create a model for owner
MODEL: OWNER
## An owner has a name and address, and can have multiple credit cards
COLUMNS: name, address, credit_card_id

>>Code:
    >rails g model Owner name:string address:string credit_card_id:integer

    >db:migrate

## Create a model for credit card
MODEL: CREDIT CARD
## A credit card has a number, an expiration date, and an owner
COLUMNS: number, expiration date, owner_id

>>Code:
    >rails g model CreditCard number:integer expiration_date:date owner_id:integer

`NOTE: integer has a limit of characaters `
`NOTE: credit_card:nil NOT necessary`
`NOTE: data type date default: YYMMDD`

## Challenges
## Create three owners and save them in the database

>>Code:
Owner.create name:'John', address:'333 3rd St. San Diego, 92222',
 credit_card_id:nil

>> models folder: manually type in
    >>credit_card.rb
        class CreditCard < ApplicationRecord
        belongs_to :owner
        end
    >>owner.rb 
        class Owner < ApplicationRecord
        has_many :credit_cards
        end

>>output:
 [#<Owner:0x00007f7cd6065b30    
  id:1,    
  name:"Cathrine",                                          
  address: "111 First St. San Diego, 92121",                 
  credit_card_id: nil,                                       
  created_at: Thu, 01 Sep 2022 18:30:54.670004000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 18:30:54.670004000 UTC +00:00>,
 #<Owner:0x00007f7cd60659f0                                  
  id: 2,                                                     
  name: "Joseph",                                            
  address: "222 2nd St. San Diego, 92121",                   
  credit_card_id: nil,                                       
  created_at: Thu, 01 Sep 2022 18:32:41.047905000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 18:32:41.047905000 UTC +00:00>,
 #<Owner:0x00007f7cd6065928
  id: 3,
  name: "John",
  address: "333 3rd St. San Diego, 92222",
  credit_card_id: nil,
  created_at: Thu, 01 Sep 2022 18:33:44.467114000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 18:33:44.467114000 UTC +00:00>] 

## Create a credit card in the database for each owner
>>Code:
new_card.credit_cards.create number:123458888, expiration_date:2301
23

## Add two more credit cards to one of the owners

>>output:
[#<CreditCard:0x00007fbe020f6a78                                  
  id: 1,                                                          
  number: 123456789,                                              
  expiration_date: Mon, 24 Dec 2012,                              
  owner_id: 1,                                                    
  created_at: Thu, 01 Sep 2022 18:46:26.965976000 UTC +00:00,     
  updated_at: Thu, 01 Sep 2022 18:46:26.965976000 UTC +00:00>,    
 #<CreditCard:0x00007fbe020f6910                                  
  id: 2,                                                          
  number: 123458888,                                              
  expiration_date: Mon, 23 Dec 2024,                              
  owner_id: 1,                                                    
  created_at: Thu, 01 Sep 2022 18:57:32.371106000 UTC +00:00,     
  updated_at: Thu, 01 Sep 2022 18:57:32.371106000 UTC +00:00>,
 #<CreditCard:0x00007fbe020f6848
  id: 3,
  number: 123458888,
  expiration_date: Mon, 23 Dec 2024,
  owner_id: 1,
  created_at: Thu, 01 Sep 2022 21:28:18.259952000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 21:28:18.259952000 UTC +00:00>,
 #<CreditCard:0x00007fbe020f6730
  id: 4,
  number: 123458888,
  expiration_date: Mon, 23 Jan 2023,
  owner_id: 2,
  created_at: Thu, 01 Sep 2022 23:12:21.678783000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 23:12:21.678783000 UTC +00:00>,
 #<CreditCard:0x00007fbe020f6668
  id: 5,
  number: 1234567890,
  expiration_date: Mon, 23 Jan 2023,
  owner_id: 2,
  created_at: Thu, 01 Sep 2022 23:13:40.300266000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 23:13:40.300266000 UTC +00:00>,
 #<CreditCard:0x00007fbe020f6550
  id: 6,
  number: 1234567890,
  expiration_date: Mon, 02 Jan 2023,
  owner_id: 3,
  created_at: Thu, 01 Sep 2022 23:14:34.430684000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 23:14:34.430684000 UTC +00:00>] 

## Stretch Challenge
## Add a credit limit to each card
## Find the total credit extended to the owner with multiple credit cards