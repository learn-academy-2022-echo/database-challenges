<!-- BANK CHALLENGE -->
<!-- Create a new rails application and database -->

    rails new bank -d postgresql -T
    cd bank
    rails db:create
    rails server
    create new terminal
  

<!-- Create a model for owner -->
    rails g model Owner 

<!-- An owner has a name and address, and can have multiple credit cards -->
    in terminal
    rails g model Owner name:string address:string
    rails db:migrate


<!-- Create a model for credit card -->
    rails g model Credit

<!-- A credit card has a number, an expiration date, and an owner -->
    in terminal
    rails g model Credit card_num:integer exp_date:integer owner_id:integer
    rails db:migrate



<!-- Challenges -->
<!-- Create three owners and save them in the database -->
    make sure rails console is refeshed or open a new one
    Owner.create name: "Joe", address: "124 Dolly lane"
    Owner.create name: "Moe", address: "125 Dolly lane"
    Owner.create name: "Zoe", address: "126 Dolly lane"

<!-- Create a credit card in the database for each owner -->
    edited the app/models/card.rb and added belongs_to :owner
    edited the app/model/owner.rb and added has_many :cards

    Credit.create card_num: 123456789, exp_date: 20221031


<!-- this doesn't work, no method error -->
    in rails console
    joe = Owner.first
    joe.credits.create card_num:147258369, exp_date: 20221031


<!-- Add two more credit cards to one of the owners -->


<!-- Stretch Challenge -->
<!-- Add a credit limit to each card -->

    in terminal, rails g migration add_column_limit_to_credit

    in the db/migration/AddColumnLimitToCredit.rb file there will be a method
    within the method added the following code
        add_column :credits, :limit, :integer
    so add_column has 3 arguments, the table to be changed, the column to be added, and data type

    in terminal, rails db:migrate
    this now adds the new column to the schema.rb file


<!-- DELETE a Model -->

    in terminal, rails destroy model Credit
    in terminal, rails db:drop
    ...we forgot the rest


Find the total credit extended to the owner with multiple credit cards