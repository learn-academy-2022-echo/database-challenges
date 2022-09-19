Validations Challenges

# Create a Rails application called company_contacts. The app will have a PostgreSQL database

$ rails new company_contacts -d postgresql -T

# Generate a model called Account that has a username, a password, and an email.

$ rails generate model Account username:string password:integer email:string
$ rails db:migrate 

All stories should have accompanying model specs.

DONE!


# Developer Stories

# As a developer, I need username, password, and email to be required. ✅

--- rspec file
require 'rails_helper'

RSpec.describe Account, type: :model do

  it 'throws an error if username is empty' do
  account = Account.create  username: nil , password: 123 , email: 'joe@gmail.com'

  p account.errors[:username]

  expect(account.errors[:username]).to_not be_empty
  expect(account.errors[:username]).to eq ["can't be blank"]

  end

  it 'throws an error if password is empty' do
    account = Account.create  username: 'joey' , password: nil , email: 'joe@gmail.com'
  
    p account.errors[:password]
  
    expect(account.errors[:password]).to_not be_empty
    expect(account.errors[:password]).to eq ["can't be blank"]
  
    end

    it 'throws an error if email is empty' do
      account = Account.create  username: 'jleonardo' , password: 123 , email: nil
    
      p account.errors[:email]
    
      expect(account.errors[:email]).to_not be_empty
      expect(account.errors[:email]).to eq ["can't be blank"]
    
      end

end

--- model file
class Account < ApplicationRecord
    validates :username, :password, :email, presence:true
end


# As a developer, I need every username to be at least 5 characters long.



As a developer, I need each username to be unique.
As a developer, I need each password to be at least 6 characters long.
As a developer, I need each password to be unique.
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
As a developer, I want to validate the presence of all fields on Address.
