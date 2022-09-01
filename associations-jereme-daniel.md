# Banking Challenge
# Setup
<!-- Create a new rails application and database ✅ -->
<!-- Create a model for owner -->✅
rails generate model Owner name:string address:string
<!-- An owner has a name and address, and can have multiple credit cards -->✅
<!-- Create a model for credit card -->✅
<!-- A credit card has a number, an expiration date, and an owner -->✅
rails generate model CreditCard number:integer exp_date:string owner_id:integer
rails db:migrate
# Challenges
<!-- Create three owners and save them in the database -->✅
Owner.create name:'Joe', address:'123 Cherry St'
Owner.create name:'Chris', address:'976 Whatever Ln'
Owner.create name:'Roger', address:'574 Kings Ct'
<!-- Create a credit card in the database for each owner -->✅
class CreditCard < ApplicationRecord
    belongs_to :owner               <-- added to CreditCard model, linking CreditCard to                                    Owner
end

class Owner < ApplicationRecord
    has_many :credit_cards               <-- added to Owner model, allows users to have                                     multiple credit cards
end

CreditCard.create number:'5555222233331234', exp_date:'01/29', owner_id:1
CreditCard.create number:'5564182249337684', exp_date:'08/26', owner_id:2
CreditCard.create number:'5698128998432295', exp_date:'05/23', owner_id:3


<!-- Add two more credit cards to one of the owners -->✅
joe.credit_cards.create number:'5555222233335682', exp_date:'01/29'
joe.credit_cards.create number:'1234987654326754', exp_date:'01/26'

# Stretch Challenge
<!-- Add a credit limit to each card -->✅


class AddCreditLimitToCreditCard < ActiveRecord::Migration[7.0]
  def change
    add_column :credit_cards, :credit_limit, :string   --- created migration to add         
                                                            credit_limit column to credit_cards table
  end
end



all_cards = CreditCard.all
all_cards.update credit_limit:'10000'
<!-- Find the total credit extended to the owner with multiple credit cards -->✅

rails g migration change_data_type_of_credit_limit

class ChangeDataTypeOfCreditLimit < ActiveRecord::Migration[7.0]
  def change
    change_column :credit_cards, :credit_limit, :integer, using: 'credit_limit::integer'
  end
end
<!-- This converted credit_limit data type to integer instead of the initial data type we assigned (string) -->✅

joescredit.sum(:credit_limit)