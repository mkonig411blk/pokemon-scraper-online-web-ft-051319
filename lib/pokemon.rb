class Pokemon
  attr_accessor :name, :type, :db 
  attr_reader :id
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    id = pokemon[0][0]
    name = pokemon[0][1]
    type = pokemon[0][2]
    new_pokemon = self.new(id, name, type)
    return new_pokemon
  end
end
