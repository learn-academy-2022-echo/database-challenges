Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
```ruby
rails generate model Person first_name:'string' last_name:'string' phone:'string'
```

Run a migration to set up the database.
```ruby
 rolodex_challenge git:(main) ✗ rails db:migrate
== 20220831184357 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0385s
== 20220831184357 Create
```
Open up Rails console.


Add five family members into the Person table in the Rails console.
```ruby
3.0.0 :001 > Person.create first_name:'John', last_name:'Smith', phone:'515-555-5554'
  TRANSACTION (0.2ms)  BEGIN
  Person Create (1.5ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "John"], ["last_name", "Smith"], ["phone", "515-555-5554"], ["created_at", "2022-08-31 18:46:32.330310"], ["updated_at", "2022-08-31 18:46:32.330310"]]                                          
  TRANSACTION (0.8ms)  COMMIT                            
 =>                                 
#<Person:0x00007f98147e9920                                
 id: 1,                         
 first_name: "John",                  
 last_name: "Smith",                 
 phone: "515-555-5554",         
 created_at: Wed, 31 Aug 2022 18:46:32.330310000 UTC +00:00,                               
 updated_at: Wed, 31 Aug 2022 18:46:32.330310000 UTC +00:00>               
3.0.0 :002 > 

3.0.0 :002 > Person.create first_name:'John', last_name:'Doe', phone:'525-666-6767'

3.0.0 :003 > Person.create first_name:'Steve', last_name:'Day', phone:'217-321-5454'

3.0.0 :004 > Person.create first_name:'Peter', last_name:'Piper', phone:'424-545-6897'

3.0.0 :005 > Person.create first_name:'Kevin', last_name:'Bacon', phone:'321-543-6543'
```

Retrieve all the items in the database.
Add yourself to the Person table.
```ruby
3.0.0 :006 > Person.all
```

Retrieve all the entries that have the same last_name as you.
```ruby
3.0.0 :010 > Person.where first_name:'John'
```
(We used fictional characters but had two with the same first name)


Update the phone number of the last entry in the database.
```ruby
3.0.0 :011 > contact = Person.last

3.0.0 :012 > contact.update phone:'123-456-7890'
```
Retrieve the first_name of the third Person in the database.
```ruby
3.0.0 :016 > firstname = Person.find 3

3.0.0 :017 > firstname.first_name
 => "Steve" 
```