require_relative( '../db/sql_runner' )

class Level

  attr_accessor( :level_type, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @level_type = options['level_type']
  end

  def save()
    sql = "INSERT INTO levels
    (
      level_type
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@level_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM levels"
    results = SqlRunner.run( sql )
    return results.map { |level| Level.new( level ) }
  end

  def self.find(id)
    sql = "SELECT * FROM levels
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    level = Level.new(result)
    return level
  end

  def self.delete_all()
    sql = "DELETE FROM levels"
    SqlRunner.run( sql )
  end

end
