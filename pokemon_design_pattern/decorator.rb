# ラッパーオブジェクトを追加して振る舞いを拡張する
# 既存のオブジェクトに変更を加えなくて済む

class Pokemon
  def attack
    raise NotImplementedError
  end
end

class Tekkanin < Pokemon
  def attack
    puts 'むしのていこう'
  end
end

class TokuseiDecorator < Pokemon
  def initialize(pokemon)
    @pokemon = pokemon
  end

  def attack
    @pokemon.attack
  end
end

class SpeedBoostDecorator < TokuseiDecorator
  def attack
    super
    puts 'かそくで素早さがあがった'
  end
end

tekkanin = Tekkanin.new
SpeedBoostDecorator.new(tekkanin).attack
