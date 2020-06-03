require_relative('../db/sql_runner')

# probably a future thing for now

class Item

  attr_reader( :name, :character_id, :id, :effect )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @effect = options['effect']
    @character_id = options['character_id'].to_i
  end

  def save()
    sql = "INSERT INTO items
    (
      name,
      effect,
      character_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @effect, @character_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM items"
    results = SqlRunner.run( sql )
    return results.map { |item| Item.new( item ) }
  end

  def character()
    sql = "SELECT * FROM characters
    WHERE id = $1"
    values = [@character_id]
    results = SqlRunner.run( sql, values )
    return Character.new( results.first )
  end

  # def campaign()
  #   sql = "SELECT * FROM campaigns
  #   WHERE id = $1"
  #   values = [@campaign_id]
  #   results = SqlRunner.run( sql, values )
  #   return Campaign.new( results.first )
  # end

  def self.delete_all()
    sql = "DELETE FROM items"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM items
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end


end
