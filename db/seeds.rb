# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#passwords are "hungry"/"sohungry"
Customer.create(username: "Alex", email: "alex@hungry.com", encrypted_password: "$2a$11$Mr8m7Kz5GR9tzHhaw52iJONxDKgwlTBFW0yECQPyaeGWnpQRUe0Ze")
Customer.create(username: "Michelle", email: "michelle@sohungry.com", encrypted_password: "$2a$11$Gf/F/KSu85ADBthHFIGNv.E2N2wo/8MtfVHQHVEzCMfW0OpNNttHe")

#all passwords are banana:
Vendor.create(username:  "Avnerosmith's Banana Blitz", email:  "banana@blitz.com", encrypted_password: "$2a$11$OlFuYullKlRSRZKqSCVAMuVFGbVQMyO57/gOk9aDmdKYw3BRLYH1K", schedule: "M-F 8-3, S,S 10-10")
Vendor.create(username:  "The Baker Brats", email: "matt@brat.wurst", encrypted_password: "$2a$11$P1DmsiOCKAQNcju5PK0GwuFWSp2LamSk0IuvGvNsNSEft30.QXCLa", schedule: "T-F 9-3, S,S 9-10")
Vendor.create(username:  "3 Duke's Greene's", email:  "duke@greene.ss", encrypted_password: "$2a$11$4VwP10UfyB9tm88PSKYiaOq/3jQDIrm.nB.GwgBBRM3uC0T3qBfna", schedule: "M-F 10-6, S,S 8-7")
Vendor.create(username:  "Pete's Pristine Perfect Pineapple Pizza", email:  "pete@perfect.pz", encrypted_password: "$2a$11$hEOoHmK49plSxqnuQjYJbOzcdfPxRpCyAnnMJdw.cke0OtL0ujqqW", schedule: "T-F 8-5, S,S 9-8")
Vendor.create(username:  "Ellie's Elegant Eclairs", email: "ellie@eclairs.com", encrypted_password: "$2a$11$JAjtQOuYuX3EXQiNB0.S5OQLlEybLKHzy1ZsGF5kYxwhtahNGOEvK", schedule: "W-F 11-8, S,S 9-5")
Vendor.create(username:  "Alycit Confec-ssions", email: "alyssa@confess.com", encrypted_password: "$2a$11$wHc2eptwRADfwtfZzmoqdOXTnBRpZ0jFXoL0Jd6d6579QGdjmu9mG", schedule: "W-F 11-8, S,S 9-5")

Favorite.create(customer_id: 2, vendor_id: 1)
Favorite.create(customer_id: 2, vendor_id: 3)
Favorite.create(customer_id: 2, vendor_id: 4)
Favorite.create(customer_id: 2, vendor_id: 5)
Favorite.create(customer_id: 2, vendor_id: 6)
Favorite.create(customer_id: 1, vendor_id: 1)
Favorite.create(customer_id: 1, vendor_id: 2)
Favorite.create(customer_id: 1, vendor_id: 3)

Foodcategory.create(name: "drinks") #1
Foodcategory.create(name: "hot dogs") #2
Foodcategory.create(name: "burgers") #3
Foodcategory.create(name: "sandwiches") #4
Foodcategory.create(name: "salads") #5
Foodcategory.create(name: "vegan") #6
Foodcategory.create(name: "wraps") #7
Foodcategory.create(name: "pizza") #8
Foodcategory.create(name: "cakes") #9
Foodcategory.create(name: "cookies") #10
Foodcategory.create(name: "donuts") #11
Foodcategory.create(name: "cupcakes") #12
Foodcategory.create(name: "icecream") #13

###vendors who sell drinks
Vendorscategory.create(vendor_id: 1, foodcategory_id: 1)
Vendorscategory.create(vendor_id: 2, foodcategory_id: 1)
Vendorscategory.create(vendor_id: 3, foodcategory_id: 1)
Vendorscategory.create(vendor_id: 4, foodcategory_id: 1)
Vendorscategory.create(vendor_id: 5, foodcategory_id: 1)
Vendorscategory.create(vendor_id: 6, foodcategory_id: 1)
###vendors who sell hot dogs
Vendorscategory.create(vendor_id: 2, foodcategory_id: 2)
###vendors who sell burgers
Vendorscategory.create(vendor_id: 2, foodcategory_id: 3)
###vendors who sell sandwiches
Vendorscategory.create(vendor_id: 2, foodcategory_id: 4)
Vendorscategory.create(vendor_id: 4, foodcategory_id: 4)
Vendorscategory.create(vendor_id: 1, foodcategory_id: 4)
###vendors who sell salads
Vendorscategory.create(vendor_id: 3, foodcategory_id: 5)
Vendorscategory.create(vendor_id: 1, foodcategory_id: 5)
Vendorscategory.create(vendor_id: 4, foodcategory_id: 5)
###vendors who sell vegan
Vendorscategory.create(vendor_id: 3, foodcategory_id: 6)
###vendors who sell wraps
Vendorscategory.create(vendor_id: 3, foodcategory_id: 7)
###vendors who sell pizza
Vendorscategory.create(vendor_id: 4, foodcategory_id: 8)
###vendors who sell cakes
Vendorscategory.create(vendor_id: 1, foodcategory_id: 9)
Vendorscategory.create(vendor_id: 5, foodcategory_id: 9)
Vendorscategory.create(vendor_id: 6, foodcategory_id: 9)
###vendors who sell cookies
Vendorscategory.create(vendor_id: 5, foodcategory_id: 10)
Vendorscategory.create(vendor_id: 6, foodcategory_id: 10)
###vendors who sell donuts
Vendorscategory.create(vendor_id: 6, foodcategory_id: 11)
###vendors who sell cupcakes
Vendorscategory.create(vendor_id: 6, foodcategory_id: 12)
###vendors who sell icecream
Vendorscategory.create(vendor_id: 6, foodcategory_id: 13)
Vendorscategory.create(vendor_id: 1, foodcategory_id: 13)

###items for vendor 1
Item.create(title: "Banana Split", description: "vanilla frozen custard nestled between a fresh, split banana", price: 7, vendor_id: 1)
Item.create(title: "Banana Shake", description: "Real Ice Cream mixed with real strawberries and fresh banana into a thick and creamy shake, finished with whipped topping and a cherry", price: 4, vendor_id: 1)
Item.create(title: "Banana Sandwich", description: "Fresh eggs, bacon, and hashbrowns", price: 12, vendor_id: 1)
Item.create(title: "Banana Salad", description: "Bananas, pineapple, mango with a touch of honey", price: 5, vendor_id: 1)
Item.create(title: "Banana Bread", description: "Treenuts, milk, egg, soy, wheat", price: 2.5, vendor_id: 1)
Item.create(title: "Banana Pudding", description: "Milk, bananas", price: 2.5, vendor_id: 1)
###items for vendor 2
Item.create(title: "Rootbeer", description: "tsssssssssss...", price: 5.5, vendor_id: 2)
Item.create(title: "Chicago Dog", description: "deliciousss...", price: 2.5, vendor_id: 2)
Item.create(title: "Bratwurst", description: "Wurst, pretzel bread, mustard, salt", price: 2.5, vendor_id: 2)
Item.create(title: "Char Dog", description: "A dog that is charred, mustard, mayo, pepper", price: 2.5, vendor_id: 2)
Item.create(title: "Burgers", description: "Plain, with bacon or egg", price: 8, vendor_id: 2)
Item.create(title: "BLT Sandwich", description: "Bacon, lettuce, tomato", price: 6, vendor_id: 2)
Item.create(title: "Pulled Pork Sandwich", description: "Pulled pork, mustard, mayo, ketchup", price: 6, vendor_id: 2)
###items for vendor 3
Item.create(title: "Greene Smoothie", description: "Kale, cabbage, spinach, pepper", price: 7, vendor_id: 3)
Item.create(title: "Cucumber Water", description: "Cucumbers, water", price: 2.3, vendor_id: 3)
Item.create(title: "Salads", description: "various, make your own", price: 6, vendor_id: 3)
Item.create(title: "Vegan Wrap", description: "all greene", price: 7.5, vendor_id: 3)
###items for vendor 4
Item.create(title: "Soda", description: "ask the vendor", price: 2, vendor_id: 4)
Item.create(title: "Subs", description: "the works", price: 5.5, vendor_id: 4)
Item.create(title: "Greek Salad", description: "Lettuce, feta cheese, please say cheese!", price: 4, vendor_id: 4)
Item.create(title: "Italian Salad", description: "Olives, italian dressing", price: 6, vendor_id: 4)
Item.create(title: "Chicken Salad", description: "Chicken Breast, tomatos, oil, vinegar", price: 6.5, vendor_id: 4)
Item.create(title: "Vegetarian Pizza", description: "Cheese, tomato sauce, olives, peppers, artichokes", price: 10, vendor_id: 4)
Item.create(title: "All Meat Pizza", description: "Just like vegetarian, but with meat", price: 11, vendor_id: 4)
###items for vendor 5
Item.create(title: "Milkshake", description: "Milk, shake!", price: 3.5, vendor_id: 5)
Item.create(title: "Soda", description: "ask the vendor", price: 1, vendor_id: 5)
Item.create(title: "Eclair", description: "choux dough filled with a cream and topped with icing", price: 4, vendor_id: 5)
Item.create(title: "Ellie's Cookies", description: "Chocolate chip, Lemon, Peanut Butter", price: 2, vendor_id: 5)
###items for vendor 6
Item.create(title: "Coconut Lavender Lemonade Drink", description: "Coconut milk, lavender, lemon juice", price: 3.5, vendor_id: 6)
Item.create(title: "Tropical Storm Punch Cocktail", description: "Storm, eggs, mango", price: 5.5, vendor_id: 6)
Item.create(title: "Plum and Thyme Prosecco Smash", description: "Plum juice, thyme, lemon, prosecco", price: 7, vendor_id: 6)
Item.create(title: "Strawberry Short Cake", description: "Strawberries, cream", price: 3.5, vendor_id: 6)
Item.create(title: "Cupcakes", description: "very delicious", price: 4, vendor_id: 6)
Item.create(title: "Cookies", description: "ask the vendor", price: 2, vendor_id: 6)
Item.create(title: "Donuts", description: "Long Johns, Infused, Confused, Refused", price: 3.5, vendor_id: 6)
Item.create(title: "Icecream", description: "Vanilla only", price: 3.5, vendor_id: 6)











