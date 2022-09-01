## Setup

Create a new rails application and database
$ rails new association_app -d postgresql -T
$ rails db:create
    Created database 'association_app_development'
    Created database 'association_app_test'
$ rails server
    # server works

Create a model for owner

$ rails generate model Owner name:string address:string credit_card_num:integer

An owner has a name and address, and can have multiple credit cards
      invoke  active_record
      create    db/migrate/20220901182747_create_owners.rb
      create    app/models/owner.rb

Create a model for credit card
$ rails generate model CreditCard number:string expiration_date:string

A credit card has a number, an expiration date, and an owner
     invoke  active_record
      create    db/migrate/20220901183200_create_credit_cards.rb
      create    app/models/credit_card.rb

      == 20220901183200 CreateCreditCards: migrating ================================
    -- create_table(:credit_cards)
    -> 0.0402s
    == 20220901183200 CreateCreditCards: migrated (0.0403s) =======================

## Challenges

Create three owners and save them in the database
Owner.create name:'Francisco', address:'123 Street St.', credit_card_num:1
  TRANSACTION (0.2ms)  BEGIN
  Owner Create (1.8ms)  INSERT INTO "owners" ("name", "address", "credit_card_num", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Francisco"], ["address", "123 Street St."], ["credit_card_num", 1], ["created_at", "2022-09-01 18:38:57.178731"], ["updated_at", "2022-09-01 18:38:57.178731"]]                               
  TRANSACTION (1.3ms)  COMMIT                                                          
 =>                                                                                    
#<Owner:0x00007f8c668914e0                                                             
 id: 1,                                                                                
 name: "Francisco",                                                                    
 address: "123 Street St.",                                                            
 credit_card_num: 1,                                                                   
 created_at: Thu, 01 Sep 2022 18:38:57.178731000 UTC +00:00,                           
 updated_at: Thu, 01 Sep 2022 18:38:57.178731000 UTC +00:00>  

Owner.create name:'Holden', address:'4321 Joe St.', credit_card_num:1
TRANSACTION (1.3ms)  BEGIN
  Owner Create (0.5ms)  INSERT INTO "owners" ("name", "address", "credit_card_num", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Holden"], ["address", "4321 Joe St."], ["credit_card_num", 1], ["created_at", "2022-09-01 18:40:48.718810"], ["updated_at", "2022-09-01 18:40:48.718810"]]                               
  TRANSACTION (1.1ms)  COMMIT                                                     
 =>                                                                               
#<Owner:0x00007f8c66216f20                                                        
 id: 2,                                                                           
 name: "Holden",                                                                  
 address: "4321 Joe St.",                                                         
 credit_card_num: 1,                                                              
 created_at: Thu, 01 Sep 2022 18:40:48.718810000 UTC +00:00,                      
 updated_at: Thu, 01 Sep 2022 18:40:48.718810000 UTC +00:00> 

Owner.create name:'Charlie', address:'2022 Echo ave.', credit_card_num:6
  TRANSACTION (0.2ms)  BEGIN
  Owner Create (0.6ms)  INSERT INTO "owners" ("name", "address", "credit_card_num", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Charlie"], ["address", "2022 Echo ave."], ["credit_card_num", 6], ["created_at", "2022-09-01 18:41:51.969105"], ["updated_at", "2022-09-01 18:41:51.969105"]]                                                                    
  TRANSACTION (1.0ms)  COMMIT                                                                                             
 =>                                                                                                                       
#<Owner:0x00007f8c663444b0                                                                                                
 id: 3,                                                                                                                   
 name: "Charlie",                                                                                                         
 address: "2022 Echo ave.",                                                                                               
 credit_card_num: 6,                                                                                                      
 created_at: Thu, 01 Sep 2022 18:41:51.969105000 UTC +00:00,                                                              
 updated_at: Thu, 01 Sep 2022 18:41:51.969105000 UTC +00:00>

Create a credit card in the database for each owner

Add two more credit cards to one of the owners

## Stretch Challenge

Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards