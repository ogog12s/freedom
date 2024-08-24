# 処理操作をカプセル化して持ち、操作の呼び出し元と実行方法を分離する

# Commandインターフェース
class Command
  def execute
    raise NotImplementedError
  end
end

class AttackCommand < Command
  def initialize(pokemon, move)
    @pokemon = pokemon
    @move = move
  end

  def execute
    puts "#{@pokemon}は#{@move}を使った！"
  end
end

class DefendCommand < Command
  def initialize(pokemon)
    @pokemon = pokemon
  end

  def execute
    puts "#{@pokemon}はまもるを使った！"
  end
end

class HealCommand < Command
  def initialize(pokemon, amount)
    @pokemon = pokemon
    @amount = amount
  end

  def execute
    puts "#{@pokemon}はキズぐすりで#{@amount}回復した！"
  end
end

# Invokerクラス
class Trainer
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute_commands
    @commands.each(&:execute)
    @commands.clear
  end
end

trainer = Trainer.new
attack_command = AttackCommand.new('ポッチャマ', 'あわ')
defend_command = DefendCommand.new('ポッチャマ')
heal_command = HealCommand.new('ポッチャマ', 20)

# 順番の変更や追加がしやすい
trainer.add_command(attack_command)
trainer.add_command(defend_command)
trainer.add_command(heal_command)
trainer.execute_commands

# ポッチャマはあわを使った！
# ポッチャマはまもるを使った！
# ポッチャマはキズぐすりで20回復した！
