## Setup

Create a new rails application and database
$ rails new association_two_app -d postgresql -T
$ rails db:create
    Created database 'association_two_app_development'
    Created database 'association_two_app_test'
$ rails server
    # server works

Create a model for owner

$ rails generate model Owner name:string address:string num_of_cards:integer

An owner has a name and address, and can have multiple credit cards
      invoke  active_record
      create    db/migrate/20220901182747_create_owners.rb
      create    app/models/owner.rb

Create a model for credit card
<!-- IGNORE THIS - SET UP INCORRECTLY -->
$ rails generate model CreditCard number:string expiration_date:string

A credit card has a number, an expiration date, and an owner
     invoke  active_record
      create    db/migrate/20220901183200_create_credit_cards.rb
      create    app/models/credit_card.rb

      == 20220901183200 CreateCreditCards: migrating ================================
    -- create_table(:credit_cards)
    -> 0.0402s
    == 20220901183200 CreateCreditCards: migrated (0.0403s) =======================

$ rails generate model Credit number:string exp_date:string owner_id:integer  
   invoke  active_record
      create    db/migrate/20220901222506_create_credits.rb
      create    app/models/credit.rb
      == 20220901222506 CreateCredits: migrating ====================================
-- create_table(:credits)
   -> 0.0447s
== 20220901222506 CreateCredits: migrated (0.0449s) ===========================


## Challenges

Create three owners and save them in the database
Owner.create name:'Francisco', address:'123 Street St.', num_of_cards:1
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

Owner.create name:'Holden', address:'4321 Joe St.', num_of_cards:1
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

Owner.create name:'Charlie', address:'2022 Echo ave.', num_of_cards:6
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

francisco = Owner.find 1
francisco.credit_cards.create number:'1234 1234 1234 1234', exp_date:'09/25'

 TRANSACTION (6.1ms)  BEGIN
  Credit Create (2.5ms)  INSERT INTO "credits" ("number", "exp_date", "owner_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", nil], ["exp_date", nil], ["owner_id", 1], ["created_at", "2022-09-01 22:57:53.927910"], ["updated_at", "2022-09-01 22:57:53.927910"]]                     
  TRANSACTION (1.2ms)  COMMIT                                                   
 =>                                                                             
#<Credit:0x00007fa1aff37cc8                                                     
 id: 1,                                                                         
 number: nil,                                                                   
 exp_date: nil,                                                                 
 owner_id: 1,                                                                   
 created_at: Thu, 01 Sep 2022 22:57:53.927910000 UTC +00:00,                    
 updated_at: Thu, 01 Sep 2022 22:57:53.927910000 UTC +00:00>  

holden = Owner.find 2
holden.credit_cards.create number:'4321 4321 4321 4321', exp_date:'01/44'

TRANSACTION (0.5ms)  BEGIN
  Credit Create (0.5ms)  INSERT INTO "credits" ("number", "exp_date", "owner_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", "4321 4321 4321 4321"], ["exp_date", "01/44"], ["owner_id", 2], ["created_at", "2022-09-01 23:05:44.104563"], ["updated_at", "2022-09-01 23:05:44.104563"]]                                                                               
  TRANSACTION (0.8ms)  COMMIT                                                   
 =>                                                                             
#<Credit:0x00007fa1b35568b8                                                     
 id: 2,                                                                         
 number: "4321 4321 4321 4321",                                                 
 exp_date: "01/44",                                                             
 owner_id: 2,                                                                   
 created_at: Thu, 01 Sep 2022 23:05:44.104563000 UTC +00:00,                    
 updated_at: Thu, 01 Sep 2022 23:05:44.104563000 UTC +00:00> 

charlie = Owner.find 3
charlie.credit_card.create number:'3214 3214 3214 3214', exp_date:'03/56'

 TRANSACTION (0.3ms)  BEGIN
  Credit Create (1.0ms)  INSERT INTO "credits" ("number", "exp_date", "owner_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", "3214 3214 3214 3214"], ["exp_date", "03/56"], ["owner_id", 3], ["created_at", "2022-09-01 23:09:18.755986"], ["updated_at", "2022-09-01 23:09:18.755986"]]                                                                               
  TRANSACTION (1.7ms)  COMMIT                                                   
 =>                                                                             
#<Credit:0x00007fe5d2d48e28                                                     
 id: 3,                                                                         
 number: "3214 3214 3214 3214",                                                 
 exp_date: "03/56",                                                             
 owner_id: 3,                                                                   
 created_at: Thu, 01 Sep 2022 23:09:18.755986000 UTC +00:00,                    
 updated_at: Thu, 01 Sep 2022 23:09:18.755986000 UTC +00:00> 

Add two more credit cards to one of the owners
francisco.credits.create number:'678678678678', exp_date:'10/46'
    TRANSACTION (24.9ms)  BEGIN
  Credit Create (0.8ms)  INSERT INTO "credits" ("number", "exp_date", "owner_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", "678678678678"], ["exp_date", "10/46"], ["owner_id", 1], ["created_at", "2022-09-01 23:18:18.314716"], ["updated_at", "2022-09-01 23:18:18.314716"]]      
  TRANSACTION (1.1ms)  COMMIT                                                   
 =>                                                                             
#<Credit:0x00007fe5d5b21c50                                                     
 id: 4,                                                                         
 number: "678678678678",                                                        
 exp_date: "10/46",                                                             
 owner_id: 1,                                                                   
 created_at: Thu, 01 Sep 2022 23:18:18.314716000 UTC +00:00,                    
 updated_at: Thu, 01 Sep 2022 23:18:18.314716000 UTC +00:00>
   francisco.credits.create number:'876876876', exp_date:'01/64'
   TRANSACTION (1.7ms)  BEGIN
  Credit Create (0.6ms)  INSERT INTO "credits" ("number", "exp_date", "owner_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", "876876876"], ["exp_date", "01/64"], ["owner_id", 1], ["created_at", "2022-09-01 23:19:36.084892"], ["updated_at", "2022-09-01 23:19:36.084892"]]         
  TRANSACTION (1.0ms)  COMMIT                                                   
 =>                                                                             
#<Credit:0x00007fe5cf705d20                                                     
 id: 5,                                                                         
 number: "876876876",                                                           
 exp_date: "01/64",                                                             
 owner_id: 1,                                                                   
 created_at: Thu, 01 Sep 2022 23:19:36.084892000 UTC +00:00,                    
 updated_at: Thu, 01 Sep 2022 23:19:36.084892000 UTC +00:00>  

## Stretch Challenge

Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards