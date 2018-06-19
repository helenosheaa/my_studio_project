require_relative( '../db/sql_runner' )

class Speciality

  attr_reader( :speciality, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @speciality = options['speciality']
  end

  def save()
    sql = "INSERT INTO specialities
    (
      speciality
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@speciality]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM specialities"
    results = SqlRunner.run( sql )
    return results.map { |speciality| Speciality.new( speciality ) }
  end

  def self.delete_all()
    sql = "DELETE FROM specialities"
    SqlRunner.run( sql )
  end
end
