require_relative( '../db/sql_runner' )

class Member

  attr_reader( :first_name, :last_name, :level_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @level_id = options['level_id']
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      level_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @level_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
  sql = "DELETE FROM members
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def yogaclasses()
    sql = "SELECT y.* FROM yogaclasses y INNER JOIN bookings b ON b.yogaclass_id = y.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |yogaclass| YogaClass.new(yogaclass) }
  end

  def update()
  sql = "UPDATE members
  SET
  (
    first_name,
    last_name,
    level_id
  ) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
  values = [@first_name, @last_name, @level_id, @id]
  SqlRunner.run(sql, values)
end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    member = Member.new(result)
    return member
  end

  def self.destroy(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
