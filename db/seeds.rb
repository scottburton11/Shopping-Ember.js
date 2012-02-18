# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = [
  { 
    name:        "Canvas Utility Jacket", 
    designer_name:    "Marc Jacobs",
    description: %Q{Long sleeve cotton and nylon blend canvas zip front jacket. Spread collar and snap cuffs. Front chest cargo pockets and vertical zip waist pockets. Fully lined with interior button pocket.},
    price_cents: 7900,
    image_url:   "http://cdn1.gilt.com/images/share/uploads/0000/0001/0225/102259532/220x294.jpg"
  },
  {
    name:        "Waxed Cotton Field Jacket",
    designer_name:    "Jack Spade",
    description: %Q{Long sleeve waxed cotton hidden button front herringbone field jacket. Shell: 100% Cotton, Lining: 100% Cotton},
    price_cents: 24900,
    image_url:   "http://cdn1.gilt.com/images/share/uploads/0000/0001/2596/125962573/220x294.jpg"
  },
  { 
    name:        "Cotton Pick Stitch Jeans", 
    designer_name:    "John Varvatos Star USA",
    description: %Q{Five pocket straight leg cotton blend pick stitch jeans. 67% Cotton, 33% Polyester.},
    price_cents: 13900,
    image_url:   "http://cdn1.gilt.com/images/share/uploads/0000/0001/3462/134627416/220x294.jpg"
  },
  { 
    name:        "Intruder Sunglasses 58mm", 
    designer_name:    "Randolph Engineering Sunglasses",
    description: %Q{Matte chrome metal frame Intruder sunglasses. Grey polarized lenses. Metal.},
    price_cents: 12900,
    image_url:   "http://cdn1.gilt.com/images/share/uploads/0000/0001/2419/124197802/220x294.jpg"
  },
]

products.each {|product| Product.create(product) }