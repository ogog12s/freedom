# 複雑なオブジェクトに対してシンプルなインターフェースを提供する

class PokemonCenter
  def initialize(pokemons)
    @pokemons = pokemons
  end

  def rest
    @pokemons.each do |pokemon|
      HealthRecovery.recover(pokemon)
      StatusRecovery.recover(pokemon)
      PPRecovery.recover(pokemon)
    end
    puts 'おあずかりした ポケモンは みんな げんきに なりました！'
  end
end

class HealthRecovery
  def self.recover(pokemon)
    "#{pokemon}の体力が回復した"
  end
end

class StatusRecovery
  def self.recover(pokemon)
    "#{pokemon}の状態異常が治った"
  end
end

class PPRecovery
  def self.recover(pokemon)
    "#{pokemon}の技ポイントが回復した"
  end
end

pokemon_team = ['ピカチュウ', 'ポッチャマ', 'メタモン']
PokemonCenter.new(pokemon_team).rest
# => おあずかりした ポケモンは みんな げんきに なりました！
