require_relative( '../db/sql_runner' )

class Character

  attr_reader( :name, :race, :class, :level,:campaign_id, :player_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @race = options['race']
    @class = options['class']
    @level = options['level'].to_i
    @campaign_id = options['campaign_id'].to_i
    @player_id = options['player_id'].to_i
  end

  def save()
    sql = "INSERT INTO characters
    (
      name,
      race,
      class,
      level,
      campaign_id,
      player_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name,@race,@class,@level,@campaign_id, @player_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE characters
    SET
    (
      name,
      race,
      class,
      level,
      campaign_id,
      player_id
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name,@race,@class,@level,@campaign_id, @player_id,@id]
    SqlRunner.run(sql, values)

  end

  def self.all()
    sql = "SELECT * FROM characters"
    results = SqlRunner.run( sql )
    return results.map { |character| Character.new( character ) }
  end

  def player()
    sql = "SELECT * FROM players
    WHERE id = $1"
    values = [@player_id]
    results = SqlRunner.run( sql, values )
    return Player.new( results.first )
  end

  def campaign()
    sql = "SELECT * FROM campaigns
    WHERE id = $1"
    values = [@campaign_id]
    results = SqlRunner.run( sql, values )
    return Campaign.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM characters"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM characters
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Character.new( results.first )
  end

  def self.destroy(id)
    sql = "DELETE FROM characters
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
