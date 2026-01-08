# SRAT

This is a program that generates the solution to the [self-referential aptitude test](http://jamespropp.org/srat-Q.txt). The program is written in Prolog, a logical programming language.

## Status

Currently, the program runs far too inefficiently to actually generate the solution, but it can proof that the actual solution is valid if given the solution.

## Running

Verify a solution:
```bash
docker run --rm -v "$(pwd):/app" -w /app swipl swipl -g "consult('srat.pl'), (solve([d,a,d,b,e,d,d,e,d,a,b,a,d,b,a,d,b,a,b,e]) -> write('Valid') ; write('Invalid')), nl, halt."
```

Interactive REPL:
```bash
docker run --rm -it -v "$(pwd):/app" -w /app swipl swipl
```

```prolog
?- [srat].  % Load the program

?- solve([d,a,d,b,e,d,d,e,d,a,b,a,d,b,a,d,b,a,b,e]).  % Verify a solution
true.

?- solve([a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a]).  % Test invalid solution
false.

?- solve(ANS).  % Generate the solution (too slow - see Status)
```
