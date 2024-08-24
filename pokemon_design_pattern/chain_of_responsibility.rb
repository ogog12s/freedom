# 木構造の要領で振る舞いをたらい回しに操作できる

class BattleHandler
  attr_accessor :next_handler

  def initialize
    @next_handler = nil
  end

  def handle_request(action)
    if @next_handler
      @next_handler.handle_request(action)
    else
      raise
    end
  end
end

class CounteractionHandler < BattleHandler
  def handle_request(action)
    if action == "たたかう"
      puts "反撃した！"
    else
      super
    end
  end
end

class EvadeHandler < BattleHandler
  def handle_request(action)
    if action == "よける"
      puts "攻撃をかわした！"
    else
      super
    end
  end
end

class DefenseHandler < BattleHandler
  def handle_request(action)
    if action == "まもる"
      puts "防御した！"
    else
      super
    end
  end
end

class ItemHandler < BattleHandler
  def handle_request(action)
    if action == "アイテム"
      puts "アイテムを使った！"
    else
      super
    end
  end
end

counter_handler = CounteractionHandler.new
evade_handler = EvadeHandler.new
defense_handler = DefenseHandler.new
item_handler = ItemHandler.new

counter_handler.next_handler = evade_handler
evade_handler.next_handler = defense_handler
defense_handler.next_handler = item_handler

["たたかう", "よける", "まもる", "アイテム"].each do |action|
  puts "相手の攻撃！"
  counter_handler.handle_request(action)
end

# 相手の攻撃！
# 反撃した！
# 相手の攻撃！
# 攻撃をかわした！
# 相手の攻撃！
# 防御した！
# 相手の攻撃！
# アイテムを使った！
