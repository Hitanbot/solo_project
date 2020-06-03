require_relative( '../db/sql_runner' )

class Player

  attr_reader( :name, :games_played, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @games_played = options['games_played'].to_i
  end

  def save()
    sql = "INSERT INTO players
    (
      name,
      games_played
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @games_played]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE players
    SET
    (
      name,
      games_played
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @games_played,@id]
    SqlRunner.run(sql, values)
  end

  def campaigns()
    sql = "SELECT c.* FROM campaigns c INNER JOIN characters b ON b.campaign_id = c.id WHERE b.player_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |campaign| Campaign.new(campaign) }
  end

  def characters
    sql="SELECT * FROM characters c WHERE c.player_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |character| Character.new(character) }
  end

  def self.all()
    sql = "SELECT * FROM players"
    results = SqlRunner.run( sql )
    return results.map { |player| Player.new( player ) }
  end

  def self.find( id )
    sql = "SELECT * FROM players
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Player.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM players"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM players
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
