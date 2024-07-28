class Pochama < Pokemon
  def initialize
    @name = 'Mijumaru'
    @type = 'Water'
    @state = NormalState.new
  end

  def evolve
    @state = EvolvedState.new
  end
end
