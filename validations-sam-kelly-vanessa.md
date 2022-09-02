Validations challenges

Developer Stories

As a developer, I need username, password, and email to be required.😍
As a developer, I need every username to be at least 5 characters long.😍
As a developer, I need each username to be unique.😍
As a developer, I need each password to be at least 6 characters long.😍
As a developer, I need each password to be unique.😍
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
As a developer, I want to validate the presence of all fields on Address.


require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Account Model' do
    it 'gives an error that username is empty' do
      user = Account.create username: nil, password: 'the', email:'samsparta@yahoo.com'

      p user.errors[:username]

      expect(user.errors[:username]).to_not be_empty
      expect(user.errors[:username][0]).to eq "can't be blank"
    end
    it 'gives an error that password is empty' do
      user = Account.create username: 'samsparta', password: nil, email:'samsparta@yahoo.com'

      p user.errors[:password]

      expect(user.errors[:password]).to_not be_empty
      expect(user.errors[:password][0]).to eq "can't be blank"
    end
    it 'gives an error that email is empty' do
      user = Account.create username: 'samsparta', password: 'the', email: nil

      p user.errors[:email]

      expect(user.errors[:email]).to_not be_empty
      expect(user.errors[:email]).to eq ["can't be blank"]
    end
    it 'gives an error username is too short' do
      user = Account.create username: 'samz', password: 'brownie123', email: 'samsparta@yahoo.com'

      p user.errors[:username]

      expect(user.errors[:username]).to_not be_empty
      expect(user.errors[:username]).to eq ["is too short (minimum is 5 characters)"]
    end
    it 'gives an error password is too short' do
      user = Account.create username: 'samsparta', password: 'mario', email: 'samsparta@yahoo.com'
  
      p user.errors[:password]
  
      expect(user.errors[:password]).to_not be_empty
      expect(user.errors[:password]).to eq ["is too short (minimum is 6 characters)"]
    end
    it 'gives an error username is already taken' do
      Account.create username: 'samsparta', password: 'mario2', email: 'samsparta2@yahoo.com'
      user = Account.create username: 'samsparta', password: 'mario', email: 'samsparta@yahoo.com'
      
      p user.errors[:username]
      
      expect(user.errors[:username]).to_not be_empty
      
      expect(user.errors[:username]).to eq ["has already been taken"]
    end
    it 'gives an error password is already taken' do
      Account.create username: 'samsparta', password: 'marioluigi', email: 'samsparta2@yahoo.com'
      user = Account.create username: 'samspa435erg', password: 'marioluigi', email: 'samsparta@yahoo.com'
      
      p user.errors[:password]
      
      expect(user.errors[:password]).to_not be_empty
      
      expect(user.errors[:password]).to eq ["has already been taken"]
    end
  end
end


class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: {minimum:5}
    validates :password, length: {minimum:6}
    validates :username, :password, uniqueness: true
end


Terminal Dump

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb

An error occurred while loading ./spec/models/account_spec.rb.
Failure/Error: __send__(method, file)

SyntaxError:
  /Users/learnacademy/Desktop/validations/spec/models/account_spec.rb:5: syntax error, unexpected `do', expecting `end'
  /Users/learnacademy/Desktop/validations/spec/models/account_spec.rb:12: syntax error, unexpected `end', expecting end-of-input
    end
    ^~~
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:2115:in `load'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:2115:in `load_file_handling_errors'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1615:in `block in load_spec_files'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1613:in `each'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1613:in `load_spec_files'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:102:in `setup'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:86:in `run'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:71:in `run'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:45:in `invoke'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/exe/rspec:4:in `<top (required)>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/rspec:23:in `load'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/rspec:23:in `<main>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/ruby_executable_hooks:22:in `eval'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/ruby_executable_hooks:22:in `<main>'
# 
#   Showing full backtrace because every line was filtered out.
#   See docs for RSpec::Configuration#backtrace_exclusion_patterns and
#   RSpec::Configuration#backtrace_inclusion_patterns for more information.
No examples found.


Finished in 0.00009 seconds (files took 0.55658 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
[]
F

Failures:

  1) Account Account Model gives an error that username is empty
     Failure/Error: expect(user.errors[:name]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:10:in `block (3 levels) in <top (required)>'

Finished in 0.33224 seconds (files took 9.57 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:5 # Account Account Model gives an error that username is empty

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb

An error occurred while loading ./spec/models/account_spec.rb.
Failure/Error: validate :username, presence: true

ArgumentError:
  Unknown key: :presence. Valid keys are: :on, :if, :unless, :prepend. Perhaps you meant to call `validates` instead of `validate`?
# ./app/models/account.rb:2:in `<class:Account>'
# ./app/models/account.rb:1:in `<main>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/bootsnap-1.13.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:32:in `require'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/bootsnap-1.13.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:32:in `require'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/zeitwerk-2.6.0/lib/zeitwerk/kernel.rb:27:in `require'
# ./spec/models/account_spec.rb:3:in `<top (required)>'
No examples found.


Finished in 0.00008 seconds (files took 1.84 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
[]
F

Failures:

  1) Account Account Model gives an error that username is empty
     Failure/Error: expect(user.errors[:name]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:10:in `block (3 levels) in <top (required)>'

Finished in 0.1207 seconds (files took 1.89 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:5 # Account Account Model gives an error that username is empty

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank"]
.

Finished in 0.1307 seconds (files took 1.81 seconds to load)
1 example, 0 failures

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb

An error occurred while loading ./spec/models/account_spec.rb.
Failure/Error: __send__(method, file)

SyntaxError:
  /Users/learnacademy/Desktop/validations/spec/models/account_spec.rb:21: syntax error, unexpected end-of-input, expecting `end'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:2115:in `load'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:2115:in `load_file_handling_errors'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1615:in `block in load_spec_files'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1613:in `each'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1613:in `load_spec_files'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:102:in `setup'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:86:in `run'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:71:in `run'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:45:in `invoke'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/exe/rspec:4:in `<top (required)>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/rspec:23:in `load'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/rspec:23:in `<main>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/ruby_executable_hooks:22:in `eval'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/ruby_executable_hooks:22:in `<main>'
# 
#   Showing full backtrace because every line was filtered out.
#   See docs for RSpec::Configuration#backtrace_exclusion_patterns and
#   RSpec::Configuration#backtrace_inclusion_patterns for more information.
No examples found.


Finished in 0.00007 seconds (files took 0.51684 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank"]
.[]
F

Failures:

  1) Account Account Model gives an error that password is empty
     Failure/Error: expect(user.errors[:password]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:18:in `block (3 levels) in <top (required)>'

Finished in 0.12564 seconds (files took 1.94 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:13 # Account Account Model gives an error that password is empty

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank"]
.["can't be blank"]
.

Finished in 0.13786 seconds (files took 2.05 seconds to load)
2 examples, 0 failures

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank"]
.["can't be blank"]
.[]
F

Failures:

  1) Account Account Model gives an error that email is empty
     Failure/Error: expect(user.errors[:email]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:26:in `block (3 levels) in <top (required)>'

Finished in 0.15555 seconds (files took 2.06 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:21 # Account Account Model gives an error that email is empty

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank"]
.["can't be blank"]
.["can't be blank"]
.

Finished in 0.15691 seconds (files took 2.07 seconds to load)
3 examples, 0 failures

➜  validations git:(main) ✗ 
➜  validations git:(main) ✗ rspec spec/models/account_spec.rb

An error occurred while loading ./spec/models/account_spec.rb.
Failure/Error: __send__(method, file)

SyntaxError:
  /Users/learnacademy/Desktop/validations/spec/models/account_spec.rb:37: syntax error, unexpected end-of-input, expecting `end'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:2115:in `load'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:2115:in `load_file_handling_errors'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1615:in `block in load_spec_files'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1613:in `each'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/configuration.rb:1613:in `load_spec_files'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:102:in `setup'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:86:in `run'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:71:in `run'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/lib/rspec/core/runner.rb:45:in `invoke'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/rspec-core-3.11.0/exe/rspec:4:in `<top (required)>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/rspec:23:in `load'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/rspec:23:in `<main>'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/ruby_executable_hooks:22:in `eval'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/bin/ruby_executable_hooks:22:in `<main>'
# 
#   Showing full backtrace because every line was filtered out.
#   See docs for RSpec::Configuration#backtrace_exclusion_patterns and
#   RSpec::Configuration#backtrace_inclusion_patterns for more information.
No examples found.


Finished in 0.00008 seconds (files took 0.33495 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank"]
.["can't be blank"]
.["can't be blank"]
.[]
F

Failures:

  1) Account Account Model gives an error username is too short
     Failure/Error: expect(user.errors[:username]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:34:in `block (3 levels) in <top (required)>'

Finished in 0.27663 seconds (files took 2.38 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:29 # Account Account Model gives an error username is too short

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
F["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
F

Failures:

  1) Account Account Model gives an error that username is empty
     Failure/Error: expect(user.errors[:username]).to eq ["can't be blank"]
     
       expected: ["can't be blank"]
            got: ["can't be blank", "is too short (minimum is 5 characters)"]
     
       (compared using ==)
     # ./spec/models/account_spec.rb:11:in `block (3 levels) in <top (required)>'

  2) Account Account Model gives an error username is too short
     Failure/Error: expect(user.errors[:username]).to eq ["needs more than 5 characters"]
     
       expected: ["needs more than 5 characters"]
            got: ["is too short (minimum is 5 characters)"]
     
       (compared using ==)
     # ./spec/models/account_spec.rb:35:in `block (3 levels) in <top (required)>'

Finished in 0.14389 seconds (files took 2.63 seconds to load)
4 examples, 2 failures

Failed examples:

rspec ./spec/models/account_spec.rb:5 # Account Account Model gives an error that username is empty
rspec ./spec/models/account_spec.rb:29 # Account Account Model gives an error username is too short

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
F["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
F

Failures:

  1) Account Account Model gives an error that username is empty
     Failure/Error: expect(user.errors[:username][0]).to eq ["can't be blank"]
     
       expected: ["can't be blank"]
            got: "can't be blank"
     
       (compared using ==)
     # ./spec/models/account_spec.rb:11:in `block (3 levels) in <top (required)>'

  2) Account Account Model gives an error username is too short
     Failure/Error: expect(user.errors[:username][1]).to eq ["is too short (minimum is 5 characters)"]
     
       expected: ["is too short (minimum is 5 characters)"]
            got: nil
     
       (compared using ==)
     # ./spec/models/account_spec.rb:35:in `block (3 levels) in <top (required)>'

Finished in 0.13253 seconds (files took 2.03 seconds to load)
4 examples, 2 failures

Failed examples:

rspec ./spec/models/account_spec.rb:5 # Account Account Model gives an error that username is empty
rspec ./spec/models/account_spec.rb:29 # Account Account Model gives an error username is too short

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
F

Failures:

  1) Account Account Model gives an error username is too short
     Failure/Error: expect(user.errors[:username][1]).to eq "is too short (minimum is 5 characters)"
     
       expected: "is too short (minimum is 5 characters)"
            got: nil
     
       (compared using ==)
     # ./spec/models/account_spec.rb:35:in `block (3 levels) in <top (required)>'

Finished in 0.12726 seconds (files took 2.02 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:29 # Account Account Model gives an error username is too short

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
F

Failures:

  1) Account Account Model gives an error username is too short
     Failure/Error: expect(user.errors[:username]).to eq "is too short (minimum is 5 characters)"
     
       expected: "is too short (minimum is 5 characters)"
            got: ["is too short (minimum is 5 characters)"]
     
       (compared using ==)
     # ./spec/models/account_spec.rb:35:in `block (3 levels) in <top (required)>'

Finished in 0.12248 seconds (files took 2.12 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:29 # Account Account Model gives an error username is too short

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.

Finished in 0.14254 seconds (files took 2.22 seconds to load)
4 examples, 0 failures

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error password is too short
     Failure/Error: expect(user.errors[:password]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:42:in `block (3 levels) in <top (required)>'

Finished in 0.18664 seconds (files took 2.22 seconds to load)
5 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:37 # Account Account Model gives an error password is too short

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb

An error occurred while loading ./spec/models/account_spec.rb.
Failure/Error:
  RSpec.describe Account, type: :model do
    describe 'Account Model' do
      it 'gives an error that username is empty' do
        user = Account.create username: nil, password: 'the', email:'samsparta@yahoo.com'
  
        p user.errors[:username]
  
        expect(user.errors[:username]).to_not be_empty
        expect(user.errors[:username][0]).to eq "can't be blank"
      end

SyntaxError:
  /Users/learnacademy/Desktop/validations/app/models/account.rb:4: syntax error, unexpected ':', expecting =>
  ... :password, length: { minimum : 6 }
  ...                              ^
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/bootsnap-1.13.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:32:in `require'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/bootsnap-1.13.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:32:in `require'
# /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/zeitwerk-2.6.0/lib/zeitwerk/kernel.rb:27:in `require'
# ./spec/models/account_spec.rb:3:in `<top (required)>'
No examples found.


Finished in 0.00012 seconds (files took 4.38 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.

Finished in 0.14832 seconds (files took 2.08 seconds to load)
5 examples, 0 failures

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user.errors[:username]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.19865 seconds (files took 2.02 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user.errors[:username]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.2981 seconds (files took 2.25 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ 
➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user.errors[:username]).to eq ["is already taken"]
     
       expected: ["is already taken"]
            got: []
     
       (compared using ==)
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.24021 seconds (files took 2.17 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user2.errors[:username]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.28826 seconds (files took 2.05 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb

["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user2.errors[:username]).to eq ["is already taken"]
     
       expected: ["is already taken"]
            got: []
     
       (compared using ==)
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.28694 seconds (files took 2.4 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ 
➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user2.errors[:username]).to eq ["is already taken"]
     
       expected: ["is already taken"]
            got: []
     
       (compared using ==)
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.32337 seconds (files took 3.62 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user2).to_not be_valid
       expected #<Account id: 12, username: "samsparta", password: [FILTERED], email: "samsparta2@yahoo.com", created_at: "2022-09-02 18:49:40.733960000 +0000", updated_at: "2022-09-02 18:49:40.733960000 +0000"> not to be valid
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.27943 seconds (files took 2.04 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user2.errors[:username]).to eq ["is already taken"]
     
       expected: ["is already taken"]
            got: []
     
       (compared using ==)
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.18532 seconds (files took 2.03 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
."this is the error"
[]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user2.errors[:username]).to eq ["is already taken"]
     
       expected: ["is already taken"]
            got: []
     
       (compared using ==)
     # ./spec/models/account_spec.rb:51:in `block (3 levels) in <top (required)>'

Finished in 0.22022 seconds (files took 2.13 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.["has already been taken"]
F

Failures:

  1) Account Account Model gives an error username is already taken
     Failure/Error: expect(user.errors[:username]).to eq ["is already taken"]
     
       expected: ["is already taken"]
            got: ["has already been taken"]
     
       (compared using ==)
     # ./spec/models/account_spec.rb:53:in `block (3 levels) in <top (required)>'

Finished in 0.23824 seconds (files took 2.65 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:45 # Account Account Model gives an error username is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.["has already been taken"]
.

Finished in 0.435 seconds (files took 4.07 seconds to load)
6 examples, 0 failures

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.["has already been taken"]
.["is too short (minimum is 6 characters)"]
F

Failures:

  1) Account Account Model gives an error password is already taken
     Failure/Error: expect(user.errors[:password]).to eq ["has already been taken"]
     
       expected: ["has already been taken"]
            got: ["is too short (minimum is 6 characters)"]
     
       (compared using ==)
     # ./spec/models/account_spec.rb:63:in `block (3 levels) in <top (required)>'

Finished in 0.3389 seconds (files took 2.37 seconds to load)
7 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:55 # Account Account Model gives an error password is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.["has already been taken"]
.[]
F

Failures:

  1) Account Account Model gives an error password is already taken
     Failure/Error: expect(user.errors[:password]).to_not be_empty
       expected `[].empty?` to be falsey, got true
     # ./spec/models/account_spec.rb:61:in `block (3 levels) in <top (required)>'

Finished in 0.33131 seconds (files took 2.49 seconds to load)
7 examples, 1 failure

Failed examples:

rspec ./spec/models/account_spec.rb:55 # Account Account Model gives an error password is already taken

➜  validations git:(main) ✗ rspec spec/models/account_spec.rb
["can't be blank", "is too short (minimum is 5 characters)"]
.["can't be blank", "is too short (minimum is 6 characters)"]
.["can't be blank"]
.["is too short (minimum is 5 characters)"]
.["is too short (minimum is 6 characters)"]
.["has already been taken"]
.["has already been taken"]
.

Finished in 0.47624 seconds (files took 2.48 seconds to load)
7 examples, 0 failures

