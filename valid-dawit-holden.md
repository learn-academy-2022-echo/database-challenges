## Validations Challenges

Create a Rails application called company_contacts. The app will have a PostgreSQL database.

 create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb

Generate a model called Account that has a username, a password, and an email.

$ rails g model Account user_name:string password:string email:string

 invoke  active_record
      create    db/migrate/20220902180342_create_accounts.rb
      create    app/models/account.rb
      invoke    rspec
      create      spec/models/account_spec.rb


== 20220902180342 CreateAccounts: migrating ===================================
-- create_table(:accounts)
   -> 0.0788s
== 20220902180342 CreateAccounts: migrated (0.0793s) ==========================
All stories should have accompanying model specs.

## Developer Stories
As a developer, I need username, password, and email to be required.
$ rspec spec/models/account_spec.rb

describe 'Account Model' do
    it 'throws an error if user_name is empty' do
      account = Account.create user_name:nil, password:'MyCat123', email:'Mycat123@yahoo.com'
      
      p account.errors[:user_name]

      expect(account.errors[:user_name]).to_not be_empty
      expect(account.errors[:user_name]).to eq ["can't be blank"]
    end
  end

GOOD FAIL (RED):
[]
F

Failures:

  1) Account Account Model throws an error if user_name is empty
     Failure/Error: expect(account.errors[:user_name]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:10:in `block (3 levels) in <top (required)>'

Finished in 0.21681 seconds (files took 5.45 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:5 # Account Account Model throws an error if user_name is empty

GOOD PASS (GREEN):
["can't be blank"]
.

Finished in 0.13347 seconds (files took 1.59 seconds to load)
1 example, 0 failures

ALL TESTS PASS:
["can't be blank"]
.["can't be blank"]
.["can't be blank"]
.

Finished in 0.12908 seconds (files took 1.71 seconds to load)
3 examples, 0 failures


As a developer, I need every username to be at least 5 characters long.

GOOD FAIL (RED):
["can't be blank"]
.["can't be blank"]
.["can't be blank"]
.[]
F

Failures:

  1) Account Account Model throws an error if the username is less than five or more characters
     Failure/Error: expect(account.errors[:user_name]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:37:in `block (3 levels) in <top (required)>'

Finished in 0.09576 seconds (files took 1.45 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:32 # Account Account Model throws an error if the username is less than five or more characters

GOOD PASS (GREEN):
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.

Finished in 0.16273 seconds (files took 1.94 seconds to load)
4 examples, 0 failures


As a developer, I need each username to be unique.


As a developer, I need each password to be at least 6 characters long.
As a developer, I need each password to be unique.
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
As a developer, I want to validate the presence of all fields on Address.