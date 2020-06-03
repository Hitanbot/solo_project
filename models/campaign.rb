require_relative( '../db/sql_runner' )

class Campaign

  attr_reader( :name, :setting, :id, :schedule )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @setting = options['setting']
    @schedule = options['schedule']
  end

  def save()
    sql = "INSERT INTO campaigns
    (
      name,
      setting,
      schedule
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @setting,@schedule]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE campaigns
    SET
    (
      name,
      setting,
      schedule
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @setting,@schedule,@id]
    SqlRunner.run(sql, values)
  end

  def players
    sql = "SELECT p.* FROM players p INNER JOIN characters c ON c.player_id = p.id WHERE c.campaign_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |player| Player.new(player) }
  end

  def characters
    sql="SELECT * FROM characters c WHERE c.campaign_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |character| Character.new(character) }
  end

  def self.all()
    sql = "SELECT * FROM campaigns"
    results = SqlRunner.run( sql )
    return results.map { |hash| Campaign.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM campaigns
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Campaign.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM campaigns"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM campaigns
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
