# SRAT

This is a program that generates the solution to the [self-referential aptitude test](http://jamespropp.org/srat-Q.txt). The program is written in Prolog, a logical programming language.

## Status

Currently, the program runs far too inefficiently to actually generate the solution, but it can proof that the actual solution is valid if given the solution.

## Running

First install [SWI-Prolog](http://www.swi-prolog.org/). Open the REPL by running `$ swipl`.

```
?- [srat].  % Load the program

?- solve([a, a, a, a, a, a]).  % Prove a given solution
false.

?- solve([ANS]).  % Generate the solution.
```
