rails new banking_app -d postgresql -T
cd banking_app
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

luis = Owner.first
luis.credit_cards.create number: 12345678, expiration_date: 230615
tuan = Owner.second
tuan.credit_cards.create number: 21204906, expiration_date: 230410
tony = Owner.third
toni.credit_cards.create number: 23141224, expiration_date: 301221