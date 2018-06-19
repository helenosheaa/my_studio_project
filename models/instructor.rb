require_relative( '../db/sql_runner' )

class Instructor

  attr_accessor( :first_name, :last_name, :speciality_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @speciality_id = options['speciality_id']
  end

  def save()
    sql = "INSERT INTO instructors
    (
      first_name,
      last_name,
      speciality_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @speciality_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM instructors
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE instructors
  SET
  (
    first_name,
    last_name,
    speciality_id
  ) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
  values = [@first_name, @last_name, @speciality_id, @id]
  SqlRunner.run(sql, values)
end

def speciality()
    speciality = Speciality.find(@speciality_id)
    return speciality
  end


  def self.all()
    sql = "SELECT * FROM instructors"
    results = SqlRunner.run( sql )
    return results.map { |instructor| Instructor.new( instructor ) }
  end

  def self.delete_all()
    sql = "DELETE FROM instructors"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM instructors
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    instructor = Instructor.new(result)
    return instructor
  end

  def self.destroy(id)
    sql = "DELETE FROM instructors
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
