# Drills

Solutions to these problems are included in the solutions branch. Please do not look at those solutions until you have at least attempted the problems.

### Fibonacci
Write a recursive method that calculates the nth [Fibonacci number](http://google.com/search?q=fibonacci%20number).
```rb
fib(0) => 1
fib(1) => 1
fib(2) => 2
fib(3) => 3
fib(4) => 5
```

### Change
Write a method (you can try writing it with both recursion and iteration) to calculate the total number of ways to make change for a given number of cents, given a set of coins that exist.

```rb
change(5, [1]) => 1 # if all we have is pennies, we can only make change in one way
change(5, [1,5]) => 2 # we could give back a nickel or 5 pennies to make 5 cents in change
change(10, [1,5]) => 3 # we could give back 2 nickels, a nickel and 5 pennies, or 10 pennies
change(99, [1,5,10,25]) => 213 # there are so many.
```
