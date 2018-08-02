Supplier.destroy_all

5.times do |index|
  Supplier.create!(name: "supp#{index}", email: "supp#{index}@gmail.com")
end

Category.destroy_all

Category.create!([{
  name: "Flower for Birthday"
  },
  {name: "Flower for Congratulation"
  },
  {name: "Flower for Wedding"
  }])

Flower.destroy_all

16.times do |index|
  Flower.create!(name: "Rose#{index}",
   category_id: Faker::Number.between(1,3),
    supplier_id: Faker::Number.between(1,5),
    price: Faker::Number.between(100000,250000),
    discount: Faker::Number.between(1.0,10.0),
    image: "anh1.jpg",
    description: "beautiful and luxurious")
end

p "Create #{Flower.count} flower"
