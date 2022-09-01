rails generate model Owner name:string adress:string credit_card:integer

rails generate model Card number:string experiation_date:string owner:string owner_id:integer

//Owner creation

Owner.create name:'Peter Griffin', address:'31 Spooner Street', credit_card

:1
  TRANSACTION (0.3ms)  BEGIN
  Owner Create (1.9ms)  INSERT INTO "owners" ("name", "address", "credit_card", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Peter Griffin"], ["address", "31 Spooner Street"], ["credit_card", 1], ["created_at", "2022-09-01 18:16:38.269180"], ["updated_at", "2022-09-01 18:16:38.269180"]]
  TRANSACTION (0.9ms)  COMMIT
 => 
#<Owner:0x00007fa1ab114d98
 id: 1,
 name: "Peter Griffin",
 address: "31 Spooner Street",
 credit_card: 1,
 created_at: Thu, 01 Sep 2022 18:16:38.269180000 UTC +00:00,
 updated_at: Thu, 01 Sep 2022 18:16:38.269180000 UTC +00:00> 

Owner.create name:'Brian Griffin', address:'31 Spooner Street', credit_card

:1
  TRANSACTION (23.8ms)  BEGIN
  Owner Create (0.8ms)  INSERT INTO "owners" ("name", "address", "credit_card", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Brian Griffin"], ["address", "31 Spooner Street"], ["credit_card", 1], ["created_at", "2022-09-01 18:17:09.032732"], ["updated_at", "2022-09-01 18:17:09.032732"]]                         
  TRANSACTION (1.4ms)  COMMIT                                                         
 =>                                                                                   
#<Owner:0x00007fa1a5745fb0                                                            
 id: 2,                                                                               
 name: "Brian Griffin",                                                               
 address: "31 Spooner Street",                                                        
 credit_card: 1,                                                                      
 created_at: Thu, 01 Sep 2022 18:17:09.032732000 UTC +00:00,                          
 updated_at: Thu, 01 Sep 2022 18:17:09.032732000 UTC +00:00>                          

Owner.create name:'Stewie Griffin', address:'31 Spooner Street', credit_car

d:1
  TRANSACTION (12.4ms)  BEGIN
  Owner Create (0.6ms)  INSERT INTO "owners" ("name", "address", "credit_card", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Stewie Griffin"], ["address", "31 Spooner Street"], ["credit_card", 1], ["created_at", "2022-09-01 18:17:20.643536"], ["updated_at", "2022-09-01 18:17:20.643536"]]
  TRANSACTION (1.3ms)  COMMIT
 => 
#<Owner:0x00007fa1ab84f568
 id: 3,
 name: "Stewie Griffin",
 address: "31 Spooner Street",
 credit_card: 1,
 created_at: Thu, 01 Sep 2022 18:17:20.643536000 UTC +00:00,
 updated_at: Thu, 01 Sep 2022 18:17:20.643536000 UTC +00:00> 
3.0.0 :004 > 

//Column create for all cards
Card.create number:'1355123234312346', experiation_date:'2024-05-08', owner:'Peter Griffin', owner_id:1
Card.create number:'0601234576431829', experiation_date:'2024-02-18', owner:'Brian Griffin', owner_id:2
Card.create number:'8960211234321346', experiation_date:'2022-12-03', owner:'Stewie Griffin', owner_id:3

Card.create number:'1294096346924684', experiation_date:'2025-12-03', owner:'Stewie Griffin', owner_id:3
Card.create number:'1294096346924684', experiation_date:'2044-04-23', owner:'Stewie Griffin', owner_id:3

// All of the owners, using Owner.all


[#<Owner:0x00007fc74964a970                                  
  id: 1,                                                     
  name: "Peter Griffin",                                     
  address: "31 Spooner Street",                              
  credit_card: 1,                                            
  created_at: Thu, 01 Sep 2022 18:16:38.269180000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:08:07.621641000 UTC +00:00,
  extended_credit: 5>,                                       
 #<Owner:0x00007fc74964a8a8                                  
  id: 3,                                                     
  name: "Stewie Griffin",                                    
  address: "31 Spooner Street",                              
  credit_card: 3,                                            
  created_at: Thu, 01 Sep 2022 18:17:20.643536000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:26:59.509545000 UTC +00:00,
  extended_credit: 140000>,
 #<Owner:0x00007fc74964a7e0
  id: 2,
  name: "Brian Griffin",
  address: "31 Spooner Street",
  credit_card: 1,
  created_at: Thu, 01 Sep 2022 18:17:09.032732000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:30:32.452040000 UTC +00:00,
  extended_credit: 150>] 
3.0.0 :027 > 


// All of the cards, using Card.all

3.0.0 :025 > Card.all
  Card Load (22.9ms)  SELECT "cards".* FROM "cards"
 =>                                                         
[#<Card:0x00007fc74f836008                                  
  id: 5,                                                    
  number: "1294096346924684",                               
  experiation_date: "2044-04-23",                           
  owner: "Stewie Griffin",                                  
  owner_id: 3,                                              
  created_at: Thu, 01 Sep 2022 21:39:11.993349000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:01:17.957578000 UTC +00:00,
  credit_limit: 60000>,                                     
 #<Card:0x00007fc74f835f40                                  
  id: 4,                                                    
  number: "1294096346924684",                               
  experiation_date: "2025-12-03",                           
  owner: "Stewie Griffin",
  owner_id: 3,
  created_at: Thu, 01 Sep 2022 21:38:41.982567000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:01:34.083834000 UTC +00:00,
  credit_limit: 30000>,
 #<Card:0x00007fc74f835e78
  id: 3,
  number: "8960211234321346",
  experiation_date: "2022-12-03",
  owner: "Stewie Griffin",
  owner_id: 3,
  created_at: Thu, 01 Sep 2022 18:54:59.181198000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:01:38.861599000 UTC +00:00,
  credit_limit: 50000>,
 #<Card:0x00007fc74f835db0
  id: 1,
  number: "1355123234312346",
  experiation_date: "2024-05-08",
  owner: "Peter Griffin",
  owner_id: 1,
  created_at: Thu, 01 Sep 2022 18:54:45.045642000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:02:17.454424000 UTC +00:00,
  credit_limit: 5>,
 #<Card:0x00007fc74f835ce8
  id: 2,
  number: "0601234576431829",
  experiation_date: "2024-02-18",
  owner: "Brian Griffin",
  owner_id: 2,
  created_at: Thu, 01 Sep 2022 18:54:53.030019000 UTC +00:00,
  updated_at: Thu, 01 Sep 2022 22:03:02.250105000 UTC +00:00,
  credit_limit: 150>] 
3.0.0 :026 > Owner.all

// To create a card limit for the Owner table.

rails g migration add_column

class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :credit_limit, :integer
  end
end

rails db:migrate

peter = Card.find 1
peter.credit_limit = 5
peter.save

// to finish stretch goal for extended credit 

rails g migration add_extended_credit

class AddExtendedCredit < ActiveRecord::Migration[7.0]
  def change
    add_column :owners, :extended_credit, :integer
  end
end

rails db:migrate  

stew = Owner.find 3
stewie_credit = Card.where owner_id:3
stewie_credit_limit = stewie_credit.sum(:credit_limit)
stew.extended_credit = stewie_credit_limit