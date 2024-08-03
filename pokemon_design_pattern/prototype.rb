class Pochama
  attr_accessor :name, :type, :ability, :skill, :power

  def initialize(name, type, ability, skill, power)
    @name = name
    @type = type
    @ability = ability
    @skill = skill
    @power = power
  end

  def clone
    self.class.new(name, type, ability, skill, power)
  end

  def show_status
    puts "名前: #{name}"
    puts "タイプ: #{type}"
    puts "特性: #{ability}"
    puts "技: #{skill}"
    puts "パワー: #{power}"
  end
end

pochama = Pochama.new('ポッチャマ', 'みず', 'げきりゅう', 'あわ', 50)
pochama.show_status

pochama_6v = pochama.clone
pochama_6v.power = 100
pochama_6v.show_status

# そもそもrubyにはdupやcloneメソッドがある
