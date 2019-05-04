require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(string)

    PlayDBConnection.instance.execute(<<-SQL, string)
      SELECT 
        *
      FROM
        plays
      WHERE
        title Like ?
    SQL
    
  end

  def self.find_by_playwright(string)
    PlayDBConnection.instance.execute(<<-SQL, string)
      SELECT
        *
      FROM 
        playwrights
      JOIN
        plays ON playwright_id = playwrights.id
      WHERE 
        name LIKE ?


    SQL
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end


class Playwright
  attr_accessor :name, :birth_year, :id

  def self.all
    array_of_hashes = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    array_of_hashes.map { |row_as_hash| Playwright.new(row_as_hash) }
  end

  def self.find_by_name(string)
    PlayDBConnection.instance.execute(<<-SQL, string)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name LIKE ?
    
    
    SQL
  end

  def initialize(row_as_hash)
    @id = row_as_hash["id"]
    @name = row_as_hash["name"]
    @birth_year = row_as_hash["birth_year"]
  end

  def create
    raise "already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, name, birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?,?)
    SQL

    self.id = PlayDBConnection.instance.last_insert_row_id
  end
  
  def update
    PlayDBConnection.instance.execute(<<-SQL, name, birth_year, id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ? 
    SQL
  end

  def get_plays
    PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        title, year
      FROM  
       playwrights
      JOIN plays on playwright_id = playwrights.id
      WHERE
        playwrights.id = ?
    SQL

  end

end