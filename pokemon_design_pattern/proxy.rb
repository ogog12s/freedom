# オブジェクトの生成が高コストで遅延評価や制御管理をしたいときに

class Pokemon
  def attack
    raise NotImplementedError
  end
end

class SlowStarterPokemon < Pokemon
  def initialize(name)
    @name = name
    wakeup
  end

  def attack
    puts "#{@name} のこうげき！"
  end

  private

  def wakeup
    puts "#{@name} は調子が上がらない..."
    # 起動に時間がかかる
    sleep(2)
    puts "#{@name} は調子を取り戻した！"
  end
end

class PokemonProxy < Pokemon
  def initialize(name)
    @name = name
    @wakeup_pokemon = nil
  end

  def attack
    if @wakeup_pokemon.nil?
      @wakeup_pokemon = SlowStarterPokemon.new(@name)
    end
    @wakeup_pokemon.attack
  end
end

kekking = PokemonProxy.new('ケッキング')
# この時点ではケッキングのインスタンスは生成されない
kekking.attack
# 使うタイミングで生成される
kekking.attack
# ここからは早い
