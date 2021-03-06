require_relative( '../db/sql_runner' )

class YogaClass

  attr_accessor( :name, :start_time, :duration, :capacity, :level_id, :instructor_id, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @start_time = options['start_time']
    @duration = options['duration']
    @capacity = options['capacity'].to_i
    @level_id = options['level_id'].to_i
    @instructor_id = options['instructor_id'].to_i
  end

  def save()
    sql = "INSERT INTO yogaclasses
    (
      name,
      start_time,
      duration,
      capacity,
      level_id,
      instructor_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @start_time, @duration, @capacity, @level_id, @instructor_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
  sql = "DELETE FROM yogaclasses
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def instructor()
    sql = "SELECT * FROM instructors WHERE id =$1"
    values = [@instructor_id]
    instructor = SqlRunner.run(sql, values)
    return instructor.map { |instructor| Instructor.new(instructor)}.first()
  end

  def members()
    sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.yogaclass_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def update()
  sql = "UPDATE yogaclasses
  SET
  (
    name,
    start_time,
    duration,
    capacity,
    level_id,
    instructor_id
  ) =
  (
    $1, $2, $3, $4, $5, $6
  )
  WHERE id = $7"
  values = [@name, @start_time, @duration, @capacity, @level_id, @instructor_id, @id]
  SqlRunner.run(sql, values)
end

  def level()
    level = Level.find(@level_id)
    return level
  end

  def number_of_participants()
    return members().count
  end

  def is_full?
    return (@capacity <= 0)
  end

  def add_participant()
    @capacity -= 1
    update()
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

  def self.find(id)
    sql = "SELECT * FROM yogaclasses
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    yogaclass = YogaClass.new(result)
    return yogaclass
  end

  def self.destroy(id)
    sql = "DELETE FROM yogaclasses
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
