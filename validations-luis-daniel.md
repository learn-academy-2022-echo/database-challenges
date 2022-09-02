# Validations Challenges
Create a Rails application called company_contacts. The app will have a PostgreSQL database.
Generate a model called Account that has a username, a password, and an email.
All stories should have accompanying model specs.
Developer Stories

<!-- As a developer, I need username, password, and email to be required. -->
RSpec.describe Account, type: :model do
  it 'requires a username' do
    user_one = Account.create username:nil, password:'hunter02', email:'user_one@yahoo.com'
    
    p user_one.errors[:username]

    expect(user_one.errors[:username]).to_not be_empty
  end

  it 'requires a password' do
    user_one = Account.create username:'user_one', password:nil, email:'user_one@yahoo.com'
    
    p user_one.errors[:password]

    expect(user_one.errors[:password]).to_not be_empty
  end

  it 'requires an email address' do
    user_one = Account.create username:'user_one', password:'hunter02', email:nil
    
    p user_one.errors[:email]

    expect(user_one.errors[:email]).to_not be_empty
  end

end

<!-- As a developer, I need every username to be at least 5 characters long. -->

  it 'username must be at least 5 characters long' do
    user_one = Account.create username:'user', password:'hunter02', email:'user_one@yahoo.com'
    p user_one.errors[:username]

    expect(user_one.errors[:username]).to_not be_empty
  end


<!-- VALIDATIONS -->
class Account < ApplicationRecord
    validates :username, :password, :email, presence:true
    validates :username, length: { minimum: 5 }
end

<!-- As a developer, I need each username to be unique. -->
  it 'username must be unique' do
    Account.create username:'Howardd', password:'hunter02', email:'user_one@yahoo.com'
    user_one = Account.create username:'Howardd', password:'hunter02', email:'user_one@yahoo.com'
    # p user_one.errors[:username]

    expect(user_one.errors[:username]).to_not be_empty
  end

  <!-- VALIDATIONS -->
  class Account < ApplicationRecord
    validates :username, :password, :email, presence:true
    validates :username, length: { minimum: 5 }
    validates :username, uniqueness: true
    validates :username, uniqueness: { case_sensitive: false }
end

<!-- As a developer, I need each password to be at least 6 characters long. -->

  it 'password must be at least 5 characters long' do
    user_one = Account.create username:'user', password:'ter2', email:'user_one@yahoo.com'

    expect(user_one.errors[:password]).to_not be_empty
  end


class Account < ApplicationRecord
    validates :username, :password, :email, presence:true
    validates :username, length: { minimum: 5 }
    validates :username, uniqueness: true
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }
end

<!-- As a developer, I need each password to be unique. -->

class Account < ApplicationRecord
    validates :username, :password, :email, presence:true
    validates :username, length: { minimum: 5 }
    validates :username, uniqueness: true
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }
    
end

<!-- As a developer, I want my Account model to have many associated Addresses. -->
<!-- As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers. -->
<!-- As a developer, I want to validate the presence of all fields on Address. -->

# Stretch Challenges

<!-- As a developer, I need each Account password to have at least one number. -->
<!-- HINT: Read about custom validations in the Active Record validation docs. -->
<!-- As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account. -->
<!-- HINT: Read about :scope in the Active Record validation docs. -->
<!-- As a developer, I want to validate that the Address street_number and zip are numbers. -->
<!-- HINT: Read about numericality in the Active Record validation docs. -->
<!-- As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers. -->
<!-- HINT: Read about message in the validation docs. -->


command to run test --> rspec spec/models/account_spec.rb