```ruby

$ rails new rolodex -d postgresql -T

$ rails db:create
    Created database 'rolodex_challenge_development'
    Created database 'rolodex_challenge_test'

$ rails generate model Person first_name:string last_name:string phone:string
      invoke  active_record
      create    db/migrate/20220831183621_create_people.rb
      create    app/models/person.rb

$ rails db:migrate
    == 20220831183621 CreatePeople: migrating =====================================
    -- create_table(:people)
    -> 0.1941s
    == 20220831183621 CreatePeople: migrated (0.1945s) ============================

$ rails c

$ Person.create first_name:'Natalie', last_name:'Portman', phone:'576-245-7862'
    --> #<Person:0x00007ff07965baf0
    id: 1,
    first_name: "Natalie",
    last_name: "Portman",
    phone: "576-245-7862",
    created_at: Wed, 31 Aug 2022 18:40:49.323333000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:40:49.323333000 UTC +00:00>


$ Person.all
    Person Load (9.4ms)  SELECT "people".* FROM "people"
    =>
    [#<Person:0x00007ff078e8d788
    id: 1,
    first_name: "Natalie",
    last_name: "Portman",
    phone: "576-245-7862",
    created_at: Wed, 31 Aug 2022 18:40:49.323333000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:40:49.323333000 UTC +00:00>,
    #<Person:0x00007ff078e8d620
    id: 2,
    first_name: "John",
    last_name: "Doe",
    phone: "789-542-6855",
    created_at: Wed, 31 Aug 2022 18:42:50.949841000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:42:50.949841000 UTC +00:00>,
    #<Person:0x00007ff078e8d558
    id: 3,
    first_name: "Jane",
    last_name: "Doe",
    phone: "789-854-3658",
    created_at: Wed, 31 Aug 2022 18:43:47.844118000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:43:47.844118000 UTC +00:00>,
    #<Person:0x00007ff078e8d490
    id: 4,
    first_name: "Polly",
    last_name: "Pocket",
    phone: "020-555-6248",
    created_at: Wed, 31 Aug 2022 18:44:42.055356000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:44:42.055356000 UTC +00:00>,
    #<Person:0x00007ff078e8d3c8
    id: 5,
    first_name: "Ken",
    last_name: "Doll",
    phone: "846-772-9901",
    created_at: Wed, 31 Aug 2022 18:45:17.966944000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:45:17.966944000 UTC +00:00>]

$ Person.create first_name:'Kelly', last_name:'Chan', phone:895-445-3658
    TRANSACTION (9.7ms)  BEGIN
    Person Create (0.8ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Kelly"], ["last_name", "Chan"], ["phone", "-3208"], ["created_at", "2022-08-31 18:48:08.429734"], ["updated_at", "2022-08-31 18:48:08.429734"]]
    TRANSACTION (1.0ms)  COMMIT
    =>
    #<Person:0x00007ff0794b8d88
    id: 6,
    first_name: "Kelly",
    last_name: "Chan",
    phone: "-3208",
    created_at: Wed, 31 Aug 2022 18:48:08.429734000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:48:08.429734000 UTC +00:00>

$ last = Person.last

$ last.update phone:'895-445-3658'

$ last
    =>
    #<Person:0x00007ff07cbb44b8
    id: 6,
    first_name: "Kelly",
    last_name: "Chan",
    phone: "895-445-3658",
    created_at: Wed, 31 Aug 2022 18:48:08.429734000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:50:12.909232000 UTC +00:00>

$ third_person = Person.find 3

$ third_person.first_name
 => "Jane"

$ jane = Person.find 3
$ john = Person.find 2

$ jane.update phone:last.phone
$ jane
    =>
    #<Person:0x00007ff078de2338
    id: 3,
    first_name: "Jane",
    last_name: "Doe",
    phone: "895-445-3658",
    created_at: Wed, 31 Aug 2022 18:43:47.844118000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:56:34.062772000 UTC +00:00>

$ john.update phone:last.phone
$ john
    =>
    #<Person:0x00007ff07cce73f8
    id: 2,
    first_name: "John",
    last_name: "Doe",
    phone: "895-445-3658",
    created_at: Wed, 31 Aug 2022 18:42:50.949841000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:58:15.955501000 UTC +00:00>

$ last.update last_name:'Doe'

$ goodbye1 = Person.find 1
$ goodbye2 = Person.find 4
$ goodbye3 = Person.find 5

$ goodbye1.destroy
$ goodbye2.destroy
$ goodbye3.destroy

$ Person.all
    Person Load (2.8ms)  SELECT "people".* FROM "people"
    =>
    [#<Person:0x00007ff07c9767f0
    id: 3,
    first_name: "Jane",
    last_name: "Doe",
    phone: "895-445-3658",
    created_at: Wed, 31 Aug 2022 18:43:47.844118000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:56:34.062772000 UTC +00:00>,
    #<Person:0x00007ff07c9766d8
    id: 2,
    first_name: "John",
    last_name: "Doe",
    phone: "895-445-3658",
    created_at: Wed, 31 Aug 2022 18:42:50.949841000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:58:15.955501000 UTC +00:00>,
    #<Person:0x00007ff07c9764d0
    id: 6,
    first_name: "Kelly",
    last_name: "Doe",
    phone: "895-445-3658",
    created_at: Wed, 31 Aug 2022 18:48:08.429734000 UTC +00:00,
    updated_at: Wed, 31 Aug 2022 18:59:38.824671000 UTC +00:00>]
```
