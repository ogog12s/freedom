# コレクションの内部構造に依存せずにその要素にアクセスできる

# ツリー構造のコレクション
class TreeNode
  attr_accessor :name, :children

  def initialize(name)
    @name = name
    @children = []
  end

  def add_child(child)
    @children << child
  end
end

class Iterator
  def has_next?
    raise NotImplementedError
  end

  def next
    raise NotImplementedError
  end
end

class TreeIterator < Iterator
  def initialize(root)
    @stack = [root]
  end

  def has_next?
    !@stack.empty?
  end

  def next
    current_node = @stack.pop
    current_node.children.reverse.each { |child| @stack.push(child) }
    current_node
  end
end

pochama = TreeNode.new("ポッチャマ")
pottaishi = TreeNode.new("ポッタイシ")
emperte = TreeNode.new("エンペルト")

pochama.add_child(pottaishi)
pottaishi.add_child(emperte)

iterator = TreeIterator.new(pochama)

# nextの取り方を変えれば、深さ優先、幅優先などの違いを表現できる
# 呼び出す方は気にしなくて良い
while iterator.has_next?
  node = iterator.next
  puts "#{node.name}を見つけた！"
end

# ポッチャマを見つけた！
# ポッタイシを見つけた！
# エンペルトを見つけた！
