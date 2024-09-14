# オブジェクトの状態変化を他のオブジェクトに通知する
# 疎結合で変更に強い

# Subject
class Pokemon
  attr_accessor :name, :hp

  def initialize(name, hp)
    @name = name
    @hp = hp
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end

  def take_damage(damage)
    @hp -= damage
    puts "#{@name} は #{damage} のダメージを受けた！"
    notify_observers
  end
end

# Observer(具象)
# updateを用意してあげるのが通例
class Trainer
  def initialize(name)
    @name = name
  end

  def update(pokemon)
    if pokemon.hp <= 0
      puts "#{pokemon.name}は倒れ、#{@name}は目の前がまっくらになった！"
    elsif pokemon.hp <= 30
      puts "#{@name}はヒヤヒヤしている！"
    end
  end
end

pikachu = Pokemon.new("ピカチュウ", 100)
satoshi = Trainer.new("サトシ")
ikue = Trainer.new("大谷育江")
pikachu.add_observer(satoshi)
pikachu.add_observer(ikue)

pikachu.take_damage(30)
pikachu.take_damage(50)
pikachu.take_damage(50)
# ピカチュウ は 30 のダメージを受けた！
# ピカチュウ は 50 のダメージを受けた！
# サトシはヒヤヒヤしている！
# 大谷育江はヒヤヒヤしている！
# ピカチュウ は 50 のダメージを受けた！
# ピカチュウは倒れ、サトシは目の前がまっくらになった！
# ピカチュウは倒れ、大谷育江は目の前がまっくらになった！
