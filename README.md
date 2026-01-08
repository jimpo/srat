# SRAT

This is a program that generates the solution to the [self-referential aptitude test](http://jamespropp.org/srat-Q.txt). The program is written in Prolog, a logical programming language.

## Running

Find the solution (takes ~15 seconds):
```bash
docker run --rm -v "$(pwd):/app" -w /app swipl swipl -g "consult('srat.pl'), (solve(ANS) -> write(ANS) ; write('No solution')), nl, halt."
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

?- solve(ANS).
```
