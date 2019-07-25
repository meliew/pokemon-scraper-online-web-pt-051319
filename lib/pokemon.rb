class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    #self.save(name, type, db)
    #@@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id_num, db)
  pokemon = db.execute("SELECT *
  FROM pokemon
  WHERE id = ?",
  [id_num]).flatten

  new_p = self.new
  new_p.id = pokemon[0][0]
  new_p.name = pokemon[0][1]
  new_p.type = pokemon[0][2]

  new_p
  end
end
