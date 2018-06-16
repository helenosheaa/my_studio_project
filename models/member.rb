require_relative( '../db/sql_runner' )

class Member

  attr_reader( :first_name, :last_name, :level, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @level = options['level']
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      level
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @level]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
