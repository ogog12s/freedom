require 'forwardable'

class Pokemon
  extend Forwardable
  attr_accessor :pokemon_state
  def_delegators :pokemon_state, :name, :power, :skill

  def initialize(pokemon_state)
    @pokemon_state = pokemon_state
  end

  def evolve(bbbbbb: false)
    puts "、、、おや！？#{name}の様子が、、、！"

    if bbbbbb
      puts "あれ、、、？#{name}の変化が止まった"
    else
      old_name = name
      self.pokemon_state = pokemon_state.evolve
      puts "おめでとう！#{old_name}は#{pokemon_state.name}に進化した！"
    end
  rescue PokemonState::EvolveError
    puts "#{name}はこれ以上進化できなかった！"
  end

  def attack
    puts "#{name}の#{skill}！"
    puts "相手に#{power}ダメージ"
  end
end

class Pochama < Pokemon
  def initialize
    super(PochamaState.new)
  end
end

class PokemonState
  class EvolveError < StandardError; end

  def evolve
    raise NotImplementedError
  end

  def name
    raise NotImplementedError
  end

  def power
    raise NotImplementedError
  end

  def skill
    raise NotImplementedError
  end
end

class PochamaState < PokemonState
  def evolve
    PottaishiState.new
  end

  def name
    'ポッチャマ'
  end

  def power
    10
  end

  def skill
    'あわ'
  end
end

class PottaishiState < PokemonState
  def evolve
    EmperteState.new
  end

  def name
    'ポッタイシ'
  end

  def power
    20
  end

  def skill
    'バブルこうせん'
  end
end

class EmperteState < PokemonState
  def evolve
    raise EvolveError
  end

  def name
    'エンペルト'
  end

  def power
    30
  end

  def skill
    'ハイドロポンプ'
  end
end

pokemon = Pochama.new
pokemon.attack
# "ポッチャマのあわ！"
# "相手に10ダメージ"
pokemon.evolve
# "、、、おや！？ポッチャマの様子が、、、！"
# "おめでとう！ポッチャマはポッタイシに進化した！"
pokemon.attack
# "ポッタイシのバブルこうせん！"
# "相手に20ダメージ"
pokemon.evolve(bbbbbb: true)
# "、、、おや！？ポッタイシの様子が、、、！"
# "あれ、、、？ポッタイシの変化が止まった"
pokemon.attack
# "ポッタイシのバブルこうせん！"
# "相手に20ダメージ"
pokemon.evolve
# "、、、おや！？ポッタイシの様子が、、、！"
# "おめでとう！ポッタイシはエンペルトに進化した！"
pokemon.evolve
# "、、、おや！？エンペルトの様子が、、、！"
# "エンペルトはこれ以上進化できなかった！"
