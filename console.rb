require_relative( './models/pet_store'  )
require_relative( './models/pets' )

require( 'pry-byebug' )

store1 = Store.new( {'name' => 'Wee furry animals', 'address' => '5, The Shore, Arbroath', 'type' => 'local pet supplies'} )
pet1 = Pet.new( {'pet_name' => 'Brian',  'pet_breed' => 'Snail', 'pet_image' => 'url for snail pic','store_id' => store1.id} )
pet2 = Pet.new({'pet_name' => 'Eric',  'pet_breed' => 'Rabbit', 'pet_image' => 'url for Rabbit pic','store_id' => store1.id })
pet3 = Pet.new( {'pet_name' => 'Bob',  'pet_breed' => 'Gerbil', 'pet_image' => 'url for gerbil pic','store_id' => store1.id })
pet4 = Pet.new({'pet_name' => 'Martin',  'pet_breed' => 'Skunk', 'pet_image' => 'url for sanil pic','store_id' => store1.id })

binding.pry
nil
