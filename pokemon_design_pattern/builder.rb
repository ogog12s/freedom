class Pokemon
  def initialize(builder)
    @name = builder.name
    @type = builder.type
    @ability = builder.ability
    @skill = builder.skill
    @power = builder.power
  end

  def attack
    puts "#{@name}の#{@skill}!"
    puts "#{@power}ダメージ与えた!"
  end

  # 生成ロジックとビジネスロジックを切り分けられる
  class Builder
    attr_reader :name, :type, :ability, :skill, :power

    def initialize(name)
      @name = name
    end

    def build
      Pokemon.new(self)
    end

    # チェーンできるようにする
    def add_type(type)
      @type = type
      self
    end

    def add_ability(ability)
      @ability = ability
      self
    end

    def add_skill(skill)
      @skill = skill
      self
    end

    def add_power(power)
      @power = power
      self
    end
  end
end

# ディレクタークラスを使用するとプロダクト構築の詳細をクライアントから完全に隠蔽できできる。
class PokemonDirector
  def self.build_pikachu
    Pokemon::Builder.new('ピカチュウ')
      .add_type('でんき')
      .add_ability('せいでんき')
      .add_skill('10万ボルト')
      .add_power(100)
      .build
  end

  def self.build_pochama
    Pokemon::Builder.new('ポッチャマ')
      .add_type('みず')
      .add_ability('げきりゅう')
      .add_skill('あわ')
      .add_power(50)
      .build
  end
end

pikachu = PokemonDirector.build_pikachu
pikachu.attack
# => "ピカチュウの10万ボルト!"
# => "100ダメージ与えた!"

pochama = PokemonDirector.build_pochama
pochama.attack
# => "ポッチャマのあわ!"
# => "50ダメージ与えた!"
