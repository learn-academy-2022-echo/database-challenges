Validations Challenges

Create a Rails application called company_contacts. The app will have a PostgreSQL database.

Generate a model called Account that has a username, a password, and an email.

```ruby
✗ rails g model Account username:string password:string email:string
```

All stories should have accompanying model specs.
Developer Storie

As a developer, I need username, password, and email to be required.

 1) Account Account Model throws an error if left blank
     Failure/Error: account = Account.create name: nil, password: 'apple321', email:'john.doe@gmail.com'
     
     ActiveModel::UnknownAttributeError:
       unknown attribute 'name' for Account.
     # ./spec/models/account_spec.rb:6:in `block (3 levels) in <top (required)>'

Finished in 0.13576 seconds (files took 3.28 seconds to load)
1 example, 1 failure

➜  company_contacts git:(main) ✗ rspec spec/models/account_spec.rb 
["can't be blank"]
.

Finished in 0.08123 seconds (files took 1.27 seconds to load)
1 example, 0 failures


Failures:

  1) Account Account Model throws an error if password is left blank
     Failure/Error: expect(account.errors[:password]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:17:in `block (3 levels) in <top (required)>'

Finished in 0.07108 seconds (files took 1.08 seconds to load)
2 examples, 1 failure

➜  company_contacts git:(main) ✗ rspec spec/models/account_spec.rb 
["can't be blank"]
.["can't be blank"]
.

Finished in 0.07018 seconds (files took 1.11 seconds to load)
2 examples, 0 failures

Failures:

  1) Account Account Model throws an error if email is left blank
     Failure/Error: expect(account.errors[:email]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:26:in `block (3 levels) in <top (required)>'

Finished in 0.17883 seconds (files took 1.23 seconds to load)
3 examples, 1 failure

➜  company_contacts git:(main) ✗ rspec spec/models/account_spec.rb 
["can't be blank"]
.["can't be blank"]
.["can't be blank"]
.

Finished in 0.13981 seconds (files took 1.31 seconds to load)
3 examples, 0 failures




As a developer, I need every username to be at least 5 characters long.

Failures:

  1) Account Account Model throws an error if username has less than five characters
     Failure/Error: expect(account.errors[:username]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:34:in `block (3 levels) in <top (required)>'

Finished in 0.06036 seconds (files took 1.19 seconds to load)
4 examples, 1 failure

➜  company_contacts git:(main) ✗ rspec spec/models/account_spec.rb 
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.

Finished in 0.12999 seconds (files took 1.21 seconds to load)
4 examples, 0 failures




As a developer, I need each username to be unique.

➜  company_contacts git:(main) ✗ rspec spec/models/account_spec.rb 
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.F

➜  company_contacts git:(main) ✗ rspec spec/models/account_spec.rb 
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["has already been taken"]
.

Finished in 0.06226 seconds (files took 1.09 seconds to load)
5 examples, 0 failures



As a developer, I need each password to be at least 6 characters long.

As a developer, I need each password to be unique.

As a developer, I want my Account model to have many associated Addresses.

As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

As a developer, I want to validate the presence of all fields on Address.