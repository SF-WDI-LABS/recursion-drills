# Drills

Solutions to these problems are included in the solutions branch. Please do not look at those solutions until you have at least attempted the problems.

### Factorial
Write a recursive method that calculates n!.
e.g. 5! = 5*4*3*2*1 = 120
```rb
fact(0) => 1
fact(1) => 1
fact(2) => 2
fact(3) => 6
fact(4) => 24
```

### Fibonacci
Write a recursive method that calculates the nth [Fibonacci number](http://google.com/search?q=fibonacci%20number).
```rb
fib(0) => 1
fib(1) => 1
fib(2) => 2
fib(3) => 3
fib(4) => 5
```

### Printing Pyramids
Write a recursive method that prints out a top-down pyramid with the given number of asterisks in the base.
```rb
pyramid(1)
*
pyramid(2)
**
*
pyramid(3)
***
**
*
```
Then, modify your method to print the pyramid in the opposite order. (this should be super trivial.)
```rb
pyramid(1)
*
pyramid(2)
*
**
pyramid(5)
*
**
***
****
*****
```
### Challenge: Making Change
Write a method (you can try writing it with both recursion and iteration) to calculate the total number of ways to make change for a given number of cents, given a set of coins that exist.

```rb
change(5, [1]) => 1 # if all we have is pennies, we can only make change in one way
change(5, [1,5]) => 2 # we could give back a nickel or 5 pennies to make 5 cents in change
change(10, [1,5]) => 3 # we could give back 2 nickels, a nickel and 5 pennies, or 10 pennies
change(99, [1,5,10,25]) => 213 # there are so many.
```
<details><summary>Hint enclosed</summary>
You will likely need 2 base cases and 2 recursive cases to deal with this problem: one case as you have fewer and fewer coins to use, and one as you have fewer and fewer cents to make change for. Spend some time thinking about these examples, which I would say should all be handled by a base case:
```rb
change(5, [5])
change(5, [])
change(0, [1,2,3])
change(-17, [1,2,3])
change(10, [26])
```
</details>
