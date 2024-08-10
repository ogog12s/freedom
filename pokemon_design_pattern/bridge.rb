# 実装と抽象を切り離してそれぞれ独立させられる

# 実装部分
class AttackStrategy
  def attack
    raise NotImplementedError
  end
end

class Thunderbolt < AttackStrategy
  def attack
    '10万ボルト！'
  end
end

class Bubble < AttackStrategy
  def attack
    'あわ！'
  end
end

# 抽象化部分
class Pokemon
  def initialize(name, attack_strategy)
    @name = name
    @attack_strategy = attack_strategy
  end

  def attack
    puts "#{@name}の#{@attack_strategy.attack}"
  end
end

pikachu = Pokemon.new('ピカチュウ', Thunderbolt.new)
pochama = Pokemon.new('ポッチャマ', Bubble.new)

pikachu.attack
pochama.attack
# => ピカチュウの10まんボルト！
# => ポッチャマのあわ！
