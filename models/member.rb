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

  def delete()
  sql = "DELETE FROM members
  WHERE id = $1"
  values = [@id]
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

end
