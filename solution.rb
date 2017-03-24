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

def sum(node)
  return 0 if node == nil
  return node.value + sum(node.next)
end

def fib(n)
  return 1 if n < 3
  return fib(n-1) + fib(n-2)
end

def print_pyramid(n)
  if n > 0
    p "*" * n
    print_pyramid(n-1)
  end
end

def print_pyramid_2(n)
  if n > 0
    # switching the order leads to the opposite pyramid!
    print_pyramid_2(n-1)
    p "*" * n
  end
end

def change(cents, coins_arr)
  # if we have no coins, or no cents, then our answer is 0.
  return 0 if coins_arr.empty? || cents < 0
  # if we're down to one type of coin, just figure out if we can make that many cents.
  if coins_arr.length == 1
    return 1 if cents % coins_arr.first == 0 else 0
  end
  # recurse twice: we could either use the first coin, or not use the first coin.
  return change(cents - coins_arr.first, coins_arr) + change(cents, coins_arr[1..-1])
end
