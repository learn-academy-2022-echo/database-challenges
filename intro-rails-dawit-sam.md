rails db:create 
Created database 'rolodex_challenge_development'
Created database 'rolodex_challenge_test'

rails generate model Person first_name:string last_name:string phone_number:string
      invoke  active_record
      create    db/migrate/20220831183640_create_people.rb
      create    app/models/person.rb

rails db:migrate
== 20220831183640 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0286s
== 20220831183640 CreatePeople: migrated (0.0288s) ===========================

#<Person:0x00007fa96484cb18                                                     
 id: 1,                                                                         
 first_name: "Dawit",                                                           
 last_name: "Sam",                                                              
 phone_number: "12345678",                                                      
 created_at: Wed, 31 Aug 2022 18:42:33.477489000 UTC +00:00,                    
 updated_at: Wed, 31 Aug 2022 18:42:33.477489000 UTC +00:00> 