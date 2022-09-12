Validations Challenges

Create a Rails application called company_contacts. The app will have a PostgreSQL database.

    $ rails new company_contacts -d postgresql -T
    $ rails db:create
    $ bundle add rspec-rails
    $ rails generate rspec:install
            create  .rspec
            create  spec
            create  spec/spec_helper.rb
            create  spec/rails_helper.rb
    

Generate a model called Account that has a username, a password, and an email.
All stories should have accompanying model specs.

    $ rails g model Account username:string password:string email:string
            create    db/migrate/20220902180120_create_accounts.rb
            create    app/models/account.rb
            invoke    rspec
            create      spec/models/account_spec.rb

    $ rails db:migrate
            == 20220902180120 CreateAccounts: migrating ===================================
            -- create_table(:accounts)
            -> 0.2618s
            == 20220902180120 CreateAccounts: migrated (0.2621s) ==========================


Developer Stories

As a developer, I need username, password, and email to be required.

Run to test in terminal: spec/models/account_spec.rb

spec/models/account_spec.rb


```ruby
        RSpec.describe Account, type: :model do
        it 'is not is valid without username' do
            user = Account.create username:nil, password:'qwert123', email:'coffee@gmail.com'

            p user.errors[:username]

            expect(user.errors[:username]).to_not be_empty
        end
        it 'is not is valid without password' do
            user = Account.create username:'ilikecookies', password:nil, email:'coffee@gmail.com'

            p user.errors[:password]

            expect(user.errors[:password]).to_not be_empty
        end
        it 'is not is valid without an email' do
            user = Account.create username:'ilikecookies', password:'qwert123', email:nil

            p user.errors[:email]

            expect(user.errors[:email]).to_not be_empty
        end
        end
```

app/models/account.rb 

```ruby

        class Account < ApplicationRecord
            validates :username, :password, :email, presence: true
        end
```


As a developer, I need every username to be at least 5 characters long.

spec/models/account_spec.rb
```ruby
        it 'requires a minimum of 5 characters for username' do
        user = Account.create username:'ili', password:'qwert123', email:'coffee@gmail.com'

        p user.errors[:username]

        expect(user.errors[:username]).to_not be_empty

      end
```

app/models/account.rb 
```ruby
        class Account < ApplicationRecord
            validates :username, :password, :email, presence: true
            validates :username, length: { minimum: 5}
        end
```

As a developer, I need each username to be unique.

spec/models/account_spec.rb

```ruby
    it 'does not allow duplicate usernames' do
    Account.create(username:'ilikecookies', password:'qwert123', email:'coffee@gmail.com')
    user = Account.create(username:'ilikecookies', password:'qwert123', email:'coffee@gmail.com')

    expect(user.errors[:username]).to_not be_empty

end
```

app/models/account.rb 

```ruby
    class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5}
    validates :username, uniqueness: true
end
```

As a developer, I need each password to be at least 6 characters long.

spec/models/account_spec.rb

```ruby
        it 'requires a minimum of 6 characters for password' do
        user = Account.create username:'ilikecookies', password:'qwer', email:'coffee@gmail.com'

        p user.errors[:password]

        expect(user.errors[:password]).to_not be_empty
        end
```

app/models/account.rb 

```ruby
    class Account < ApplicationRecord
        validates :username, :password, :email, presence: true
        validates :username, length: { minimum: 5 }
        validates :password, length: { minimum: 6 }
        validates :username, uniqueness: true
    end 
```

As a developer, I need each password to be unique.

spec/models/account_spec.rb

```ruby
    it 'does not allow duplicate passwords' do
    Account.create(username:'ilikecookies', password:'qwert123', email:'coffee@gmail.com')
    user = Account.create(username:'ilikecookies', password:'qwert123', email:'coffee@gmail.com')

    expect(user.errors[:password]).to_not be_empty
    end
```


app/models/account.rb
```ruby
    class Account < ApplicationRecord
        validates :username, :password, :email, presence: true
        validates :username, length: { minimum: 5 }
        validates :password, length: { minimum: 6 }
        validates :username, :password, uniqueness: true
    end
```

As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

$ rails generate model Address street_number:integer street_name:string city:string state:string zip:integer

     create    db/migrate/20220902194730_create_addresses.rb
      create    app/models/address.rb
      invoke    rspec
      create      spec/models/address_spec.rb

$ rails db:migrate

    == 20220902194730 CreateAddresses: migrating ==================================
    -- create_table(:addresses)
    -> 0.0433s
    == 20220902194730 CreateAddresses: migrated (0.0434s) =========================


As a developer, I want to validate the presence of all fields on Address.

Run to test in terminal: rspec spec/models/address_spec
.rb

spec/models/address_spec.rb
``` ruby
        require 'rails_helper'

        RSpec.describe Address, type: :model do
        it 'is not valid without a street name' do
            address1 = Address.create street_name:nil, city:'San Diego', state:'CA', zip:91902

            p address1.errors[:street_name]

            expect(address1.errors[:street_name]).to_not be_empty
        end
        it 'is not valid without a city' do
            address1 = Address.create street_name:'123 Twice Way', city:nil, state:'CA', zip:91902

            p address1.errors[:city]

            expect(address1.errors[:city]).to_not be_empty
        end
        it 'is not valid without a state' do
            address1 = Address.create street_name:'123 Twice Way', city:'San Diego', state:nil, zip:91902

            p address1.errors[:state]

            expect(address1.errors[:state]).to_not be_empty
        end

        it 'is not valid without a zip' do
            address1 = Address.create street_name:'123 Twice Way', city:'San Diego', state:'CA', zip:nil

            p address1.errors[:zip]

            expect(address1.errors[:zip]).to_not be_empty
        end
        end
```


app/models/address.rb
``` ruby
        class Address < ApplicationRecord
            validates :street_name, :city, :state, :zip, presence: true
        end
```


Stretch Challenges

As a developer, I need each Account password to have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
HINT: Read about :scope in the Active Record validation docs.
As a developer, I want to validate that the Address street_number and zip are numbers.
HINT: Read about numericality in the Active Record validation docs.
As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
HINT: Read about message in the validation docs.