rails new banking -d postgresql -T
cd banking
rails db:create
rails s


rails generate model Owner name:string address:string credit_card:integer 

rails db:migrate 

rails g model CreditCard number:integer expiration_date:date user_id:integer 

rails c

Owner.create name:'Luis Laurel', address:'123 House Blvd', credit_card: 2
Owner.create name:'Tuan Le', address: '21 Beach Blvd', credit_card: 3
Owner.create name: 'Tony Stark', address: '49 Malibu' , credit_card: 10

exit 

rails db:migrate
 
rails c

credit_card.create number: 12345678, expiration_date: 06/22, owner: 