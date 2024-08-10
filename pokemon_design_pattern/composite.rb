# ツリーのようなオブジェクト構造をしている場合に有効
# 個々のオブジェクトとオブジェクトの集合を同一視できる

class Pokemon
  def attack
    raise NotImplementedError
  end
end

class Numacraw < Pokemon
  def attack
    puts 'マッドショット'
  end
end

class Juptile < Pokemon
  def attack
    puts 'すいとる'
  end
end

class Ohsubame < Pokemon
  def attack
    puts 'つばさでうつ'
  end
end

class Hoeruko < Pokemon
  def attack
    puts 'ころがる'
  end
end

class PokemonTeam < Pokemon
  def initialize
    @pokemons = []
  end

  def add(pokemon)
    @pokemons << pokemon
  end

  def remove(pokemon)
    @pokemons.delete(pokemon)
  end

  def attack
    @pokemons.each { |pokemon| pokemon.attack }
  end
end

# それぞれの中身はクライアントは気にしなくて良い
yuki_team = PokemonTeam.new
yuki_team.add(Numacraw.new)
yuki_team.add(Ohsubame.new)

haruka_team = PokemonTeam.new
haruka_team.add(Juptile.new)
haruka_team.add(Hoeruko.new)
haruka_team.attack
# => トラウマ
