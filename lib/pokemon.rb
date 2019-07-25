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

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]
    new_pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
  end
end
