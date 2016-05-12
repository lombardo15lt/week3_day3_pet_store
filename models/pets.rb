require( 'pg' )
require_relative(  '../db/sql_runner' )
require_relative(  './pets' )

class Pet

  attr_accessor( :id, :pet_name, :pet_image, :pet_breed )
  # attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @pet_name = options[ 'pet_name' ]
    @pet_breed = options[ 'pet_breed' ]
    @pet_image = options[ 'pet_image' ]
    @store_id = options[ 'store_id' ].to_i
  end

  def save()
    sql = "INSERT INTO pets (
    pet_name,
    pet_breed,
    pet_image,
    store_id) 
    VALUES (
      '#{@pet_name}',
      '#{@pet_breed}',
      '#{@pet_image}',
      '#{@store_id}',
      ) 

      RETURNING *"
    pet = SqlRunner.run( sql ).first
    result = Pet.new( pet )
    return result
  end

  def update()
      sql = "UPDATE pets 
      SET pet_name =  '#{@pet_name}',
          pet_breed = '#{@pet_breed}',
          pet_image = '#{@pet_image}',
          store_id  = '#{@store_id}'
        where_id = #{@id}"
      pet = SqlRunner.run( sql )
      result = Pet.new( pet )  
      return result
  end

  def delete()
      sql = "DELETE FROM pets WHERE 
          pet_name =  '#{@pet_name}',
          pet_breed = '#{@pet_breed}',
          pet_image = '#{@pet_image}',
          store_id  = '#{@store_id}'
        where_id = #{@id}"
      pet = SqlRunner.run( sql )
      result = Pet.new( pet )  
      return result
  end

  def list()
      sql = "SELECT * FROM pets WHERE 
          pet_name =  '#{@pet_name}',
          pet_breed = '#{@pet_breed}',
          store_id  = '#{@store_id}'
        where_id = #{@id}"
      pet = SqlRunner.run( sql )
      result = Pet.new( pet )  
      return result

      
  end

end