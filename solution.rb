class LinkedListNode
  attr_accessor :value, :next
  # Using nxt because next is a keyword in ruby.
  def initialize(value, nxt)
    @value = value
    @next = nxt
  end
end

def length(node)
  return 0 if node == nil
  return 1 + length(node.next)
end

def change(cents, coins_arr)
  return 0 if coins_arr.empty? || cents < 0
  if coins_arr.length == 1
    return 1 if cents % coins_arr.first == 0 else 0
  end
  return change(cents - coins_arr.first, coins_arr) + change(cents, coins_arr[1..-1])
end
