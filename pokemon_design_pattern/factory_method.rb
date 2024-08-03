class Pokemon
  def attack
    raise NotImplementedError
  end
end

class Pikachu < Pokemon
  def attack
    puts '10万ボルト'
  end
end

class Pochama < Pokemon
  def attack
    puts 'あわ'
  end
end

class PokemonFactory
  def initialize(name)
    @name = name
  end

  def build
    case @name
    when 'pikachu'
      Pikachu.new
    when 'pochama'
      Pochama.new
    else
      raise NotImplementedError
    end
  end
end

pikachu = PokemonFactory.new('pikachu').build
pikachu.attack
# => 10万ボルト

pochama = PokemonFactory.new('pochama').build
pochama.attack
# => あわ
