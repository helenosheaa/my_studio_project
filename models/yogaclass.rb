require_relative( '../db/sql_runner' )

class YogaClass

  attr_reader( :name, :time, :duration, :level, :instructor_id, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @time = options['time']
    @duration = options['duration']
    @level = options['level']
    @instructor_id = options['instructor_id'].to_i
  end

  def save()
    sql = "INSERT INTO yogaclasses
    (
      name,
      time,
      duration,
      level,
      instructor_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @time, @duration, @level, @instructor_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
  sql = "DELETE FROM yogaclasses
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM yogaclasses"
    results = SqlRunner.run( sql )
    return results.map { |yogaclass| YogaClass.new( yogaclass ) }
  end

  def self.delete_all()
    sql = "DELETE FROM yogaclasses"
    SqlRunner.run( sql )
  end

end
