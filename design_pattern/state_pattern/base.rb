class Pokemon
  def initialize
    @name = ''
    @type = ''
    @state = NormalState.new
  end

  def level_up
    raise NotImplementedError
  end

  def evolve
    raise NotImplementedError
  end

  def attack
    @state.attack
  end
end

class State
  def attack
    raise NotImplementedError
  end
end

class NormalState < State
  def attack
    puts "Normal attack!"
  end
end

class SuperState < State
  def attack
    puts "Super attack!"
  end
end
