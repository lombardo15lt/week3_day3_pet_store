require( 'pg' )
require_relative(  '../db/sql_runner' )
require_relative(  './pets.rb' )

class Store

  attr_accessor( :id, :store_name, :store_id, :store_address)
  # attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @address = options[ 'address' ]
    @type = options[ 'type' ]
    # @store_id = options[ 'store_id' ].to_i
  end

  def save()
    sql = "INSERT INTO petstore (
    id,
    name,
    address,
    type) 
    VALUES (
      '#{@id}',
      '#{@name}',
      '#{@address}',
      '#{@type}',
      ) 

      RETURNING *"
    petstore = SqlRunner.run( sql )[0]
    result = Petstore.new( petstore )
    return result
  end

  def update()
      sql = "UPDATE petstore 
      SET id =  '#{@id}',
          name = '#{@name}',
          address = '#{@address}',
          type  = '#{@type}'
        where_id = #{@id}"
      petstore = SqlRunner.run( sql )
      result = Petstore.new( petstore )  
      return result
  end

  def delete()
      sql = "DELETE FROM petstore WHERE 
          id =  '#{@id}',
          name = '#{@name}',
          address = '#{@address}',
          type  = '#{@type}'
        where_id = #{@id}"
      petstore = SqlRunner.run( sql )
      result = Petstore.new( petstore )  
      return result
  end

  def list()
      sql = "SELECT * FROM petstore WHERE 
          id =  '#{@id}',
          name = '#{@name}',
          type = '#{@type}'
        where_id = #{@id}"
      petstore = SqlRunner.run( sql )
      result = Petstore.new( petstore )  
      return result

      
  end

end