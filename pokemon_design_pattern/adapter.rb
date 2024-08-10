# ここのコードが外部APIやライブラリで変更できない時に扱いを統一にするには
class Pochama
  def bubble
    puts 'ポッチャマのあわ！'
  end
end

class Pokemon
  # 全ポケモンの攻撃をattackで呼び出したい
  def attack
    raise NotImplementedError
  end
end

class PochamaAdapter < Pokemon
  def initialize(pochama)
    @pochama = pochama
  end

  # adapterで互換処理を持つ
  def attack
    @pochama.bubble
  end
end

pochama = Pochama.new
adapted_pochama = PochamaAdapter.new(pochama)

# 全てのtypeのポケモンを同じインターフェースで扱える
adapted_pochama.attack
# => ポッチャマのあわ！
