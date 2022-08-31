$ rails new rolodex_challenges -d postgresql -T
$ cd rolodex_challenges
$ rails db:create
$ rails server

$ rails generate model Person first_name:string last_name:string phone_number:string

rails db:migrate

rails c 


Created Bob Bobbington 

 Person.create first_name: 'Bob', last_name: 'Bobbington', phone_num
ber: '300-444-321' 

  TRANSACTION (18.2ms)  BEGIN
  Person Create (2.4ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Bob"], ["last_name", "Bobbington"], ["phone_number", "300-444-321"], ["created_at", "2022-08-31 19:19:16.247305"], ["updated_at", "2022-08-31 19:19:16.247305"]]                                                             
  TRANSACTION (3.9ms)  COMMIT                                                   
 =>                                                                             
#<Person:0x00007f99fab73478                                                     
 id: 1,                                                                         
 first_name: "Bob",                                                             
 last_name: "Bobbington",                                                       
 phone_number: "300-444-321",                                                   
 created_at: Wed, 31 Aug 2022 19:19:16.247305000 UTC +00:00,                    
 updated_at: Wed, 31 Aug 2022 19:19:16.247305000 UTC +00:00> 
3.0.0 :002 > 

3.0.0 :002 > Person.create first_name: 'Bob', last_name: 'Sponge', phone_number:
 '123-456-7891' 
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.4ms)  INSERT INTO "people" ("first_name", "last_name", "phone_number", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Bob"], ["last_name", "Sponge"], ["phone_number", "123-456-7891"], ["created_at", "2022-08-31 19:21:26.227446"], ["updated_at", "2022-08-31 19:21:26.227446"]]        
  TRANSACTION (0.9ms)  COMMIT
 =>                     
#<Person:0x00007f99fdae5da0
 id: 2,
 first_name: "Bob",
 last_name: "Sponge",
 phone_number: "123-456-7891",
 created_at: Wed, 31 Aug 2022 19:21:26.227446000 UTC +00:00,
 updated_at: Wed, 31 Aug 2022 19:21:26.227446000 UTC +00:00> 