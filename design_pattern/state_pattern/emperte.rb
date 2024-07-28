class Emperte < Pokemon
  def initialize
    @name = 'Emperte'
    @type = 'Water'
    @state = NormalState.new
  end

  def evolve
    @state = EvolvedState.new
  end
end
