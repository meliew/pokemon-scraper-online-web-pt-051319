class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id= nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    self.save(name, type, db)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
  find_pokemon = db.execute("SELECT *
  FROM pokemon
  WHERE id = ?
  LIMIT 1")
  end
end
