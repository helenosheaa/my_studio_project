require_relative( '../db/sql_runner' )

class Booking

  attr_reader( :member_id, :yogaclass_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @yogaclass_id = options['yogaclass_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      member_id,
      yogaclass_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@member_id, @yogaclass_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( booking ) }
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    booking = Booking.new(result)
    return booking
  end

end
