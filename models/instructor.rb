require_relative( '../db/sql_runner' )

class Instructor

  attr_reader( :first_name, :last_name, :speciality, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @speciality = options['speciality']
  end

  def save()
    sql = "INSERT INTO instructors
    (
      first_name,
      last_name,
      speciality
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @speciality]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM instructors
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM instructors"
    SqlRunner.run( sql )
  end

end
