# Recursion
## Recursion
### Recursion
#### Recursion
Recursion
> Recursion

### Setup
Create a plain Ruby file. You'll be running it with irb or pry. Add in these basic definitions of our data structures:

```rb
class LinkedListNode
  attr_accessor :value, :next
  # Using nxt because next is a keyword in ruby.
  def initialize(value, nxt)
    @value = value
    @next = nxt
  end
end
```

### So what is recursion?
Recursion is another technique we can use to solve code problems. Recursion works well on a particular type of problem: a problem where you can solve **the easy part** of the problem, solve **the rest** of the problem (which is a smaller version of the original problem), and then **glue together** those solutions. When we solve the "rest" of the problem, or the **recursive part**, we use the method we are *currently writing* to solve the rest of the problem. This means that almost all recursive methods we write have a structure that looks like this:

```rb
def every_recursive_method_ever(input)
  # base case
  return DEFAULT_ANSWER if input.IS_TRIVIAL
  #recursive case
  easy_part_answer = input[EASY_PART].SOMETHING
  recursive_part_answer = every_recursive_method_ever(input[RECURSIVE_PART])
  return recursive_part_answer.GLUE_TO(easy_part_answer)
end
```

> Aside: When writing algorithms-y code, especially with recursion, I tend to use explicit return statements, even though that's not "the ruby way." Explicit returns help me see exactly what's going on, and find all of my possible return statements more quickly. Write your code however you want; just know that this is an example of my personal preference.

We often use recursion on recursive data structures, because it's a natural fit. Here's an example we've looked at before: the length of a LinkedList.

```rb
def length(node)
  return 0 if node == nil
  return 1 + length(node.next)
end
```

Let's break down how that fits into our overall pattern. Suppose we had this list:

`1->2->3->4`

We want to break down the problem into 2 parts: the "easy part" that we can solve instantly, and the "recursive part" that is a smaller version of the original problem. One easy, natural way to break this problem up is to take the first node as the "easy part", and the remaining nodes as the "recursive part". That leaves us with a split like this:

```
1------------>2->3->4
easy         recursive
```

Solving the recursive part is where we want to make our recursive call, so we'll call the `length` method on the rest of the list. Since the "easy" part is (one) current node, we already know that it adds 1 to our overall length. Then, we'll glue those answers together to get the length of the complete list.

So if we write the `length` method to more clearly match our pattern, it might look like:

```rb
def length(node)
  #base case
  return 0 if node == nil
  #recursive case
  easy_answer = 1 #the current node has 1 length
  recursive_answer = length(node.next) #the rest of the list
  return easy_answer + recursive_answer #glue them with addition
end
```

Hooray! The same method, written with more lines of code!

<details><summary>Now, try to modify your code so that it returns the total sum of the numbers in the list. Test it before you look at the solution.</summary>

```rb
def sum(node)
  #base case
  return 0 if node == nil
  #recursive case
  return node.value  +     sum(node.next)
  #      easy_part   glue  recursive_part
end
```
</details>
<br>
While recursive data structures are a natural choice for using recursion, we can also use it for LOTS of other types of methods we need to write. Examples are in the [drills document](/drills.md).

### How to Write a Recursive Method
1. Figure out how to break up the problem into the easy part and the recursive part.
1. Figure out how to get the answer for the easy part.
1. Figure out how to stick together your answers into the overall solution.
1. Figure out your base case: at what point is the problem so small that you don't need to recurse anymore?
1. Write your base case.
1. Write your recursive case.
1. test.

### How to Debug a Recursive Method
Recursive methods are particularly tricky to debug. If you have a bug, that problem will persist through every recursive call, giving you a wildly-wrong solution even when your code is nearly correct. When this happens, you often want to start by making sure your base cases work the way you expect, and then test a problem that is just a tiny bit bigger than your base case, until you identify at which stage the solution becomes incorrect. Use lots of print/log statements to see what the values of your arguments are with each new recursive call, and make sure they line up with what you expect.

## Walkthrough: So what is this recursion even DOING?

Especially when getting started, recursion seems like insane magic. You call the method before you've finished writing it, hoping that it gives you back the right answer; then, you use that answer to build your actual solution.
The way that I like to convince myself that recursion isn't magic is to trace through exactly what's happening in my code, and convince myself that from that base case, we're building up correctly and could handle any case. I'll show one example here, and you should feel free to use this technique to explore any recursive method you write.

Let's go back to the `total_nodes` function for Trees that we've written before.
<details><summary>Try re-writing that function yourself before looking at this solution.</summary>

```rb
def total_nodes(node)
  return 0 if node == nil
  return 1 + total_nodes(node.left) + total_nodes(node.right)
end
```
</details>

I made [this pretty slideshow](https://docs.google.com/presentation/d/1JmYUC20Z2o1vo3ZxyyNQTv2Df1gTtFHmVi3jTar90ak/pub?start=false&loop=false&delayms=60000) to show what happens when we call this function on a TreeNode. Enjoy!
