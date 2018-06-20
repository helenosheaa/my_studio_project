require_relative( '../db/sql_runner' )

class Speciality

  attr_accessor( :speciality_type, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @speciality_type = options['speciality_type']
  end

  def save()
    sql = "INSERT INTO specialities
    (
      speciality_type
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@speciality_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM specialities"
    results = SqlRunner.run( sql )
    return results.map { |speciality| Speciality.new( speciality ) }
  end

  def self.find(id)
    sql = "SELECT * FROM specialities
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    speciality = Speciality.new(result)
    return speciality
  end

  def self.delete_all()
    sql = "DELETE FROM specialities"
    SqlRunner.run( sql )
  end
end
