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

end
