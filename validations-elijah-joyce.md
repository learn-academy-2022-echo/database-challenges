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

spec/models/account_spec.rb

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

app/models/account.rb 

        class Account < ApplicationRecord
            validates :username, :password, :email, presence: true
        end


As a developer, I need every username to be at least 5 characters long.

spec/models/account_spec.rb
        it 'requires a minimum of 5 characters for username' do
        user = Account.create username:'ili', password:'qwert123', email:'coffee@gmail.com'

        p user.errors[:username]

        expect(user.errors[:username]).to_not be_empty

      end

app/models/account.rb 
        class Account < ApplicationRecord
            validates :username, :password, :email, presence: true
            validates :username, length: { minimum: 5}
        end


As a developer, I need each username to be unique.

spec/models/account_spec.rb
    it 'does not allow duplicate usernames' do
    Account.create(username:'ilikecookies', password:'qwert123', email:'coffee@gmail.com')
    user = Account.create(username:'ilikecookies', password:'qwert123', email:'coffee@gmail.com')

    expect(user.errors[:username]).to_not be_empty

end

app/models/account.rb 
    class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5}
    validates :username, uniqueness: true
end




As a developer, I need each password to be at least 6 characters long.
As a developer, I need each password to be unique.
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
As a developer, I want to validate the presence of all fields on Address.
Stretch Challenges

As a developer, I need each Account password to have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
HINT: Read about :scope in the Active Record validation docs.
As a developer, I want to validate that the Address street_number and zip are numbers.
HINT: Read about numericality in the Active Record validation docs.
As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
HINT: Read about message in the validation docs.