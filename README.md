# Recursion
## Recursion
### Recursion
#### Recursion
Recursion
> Recursion

### Setup
Create a plain Ruby file. You'll be running it with irb or pry.

### So what is recursion?
Recursion is another technique we can use to solve code problems. Recursion works well on a particular type of problem: a problem where you can solve **the easy part** of the problem, solve **the rest** of the problem (which is a smaller version of the original problem), and then **glue together** those solutions. This means that almost all recursive methods we write have a structure that looks something like this:

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

We often use recursion on recursive data structures, because it's a natural fit; the rest of the data structure is a smaller version of the original data structure. Here's an example we've looked at before: the length of a LinkedList.

```rb
def length(node)
  return 0 if node == null
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

Solving the recursive part is where we want to make our recursive call, so we'll call the `length` method on the rest of the list. Since the "easy" part is the current node, we already know that it adds 1 to our overall length. Then, we'll glue those answers together to get the length of the complete list.

So if we write the `length` method to more clearly match our pattern, it might look like:

```rb
def length(node)
  #base case
  return 0 if node == null
  #recursive case
  easy_answer = 1 #the current node has 1 length
  recursive_answer = length(node.next) #the rest of the list
  return easy_answer + recursive_answer #glue them with addition
end
```

Hooray! The same method, written with more lines of code!

<details><summary>Now, try to modify your code so that it returns the total sum of the numbers in the list. Test it before you look at the solution.</summary>

Solution:
```rb
def sum(node)
  #base case
  return 0 if node == null
  #recursive case
  return node.value + sum(node.next)
  #      easy      glue     recursive
end
```
</details>
