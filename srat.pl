answer(a).
answer(b).
answer(c).
answer(d).
answer(e).

vowel(a).
vowel(e).

consonant(b).
consonant(c).
consonant(d).

allAnswers([]).
allAnswers([H | T]) :- answer(H), allAnswers(T).

% Count the number of occurances an element has in a list.
count([], _, 0).
count([X | T], X, N) :- count(T, X, M), N is M + 1.
count([H | T], X, N) :- count(T, X, N), H \= X.

countVowels([], 0).
countVowels([H | T], N) :-
    vowel(H), countVowels(T, M), N is M + 1;
    consonant(H), countVowels(T, N).

countConsonants([], 0).
countConsonants([H | T], N) :-
    consonant(H), countConsonants(T, M), N is M + 1;
    vowel(H), countConsonants(T, N).

% Count the number of times two consecutive elements in a list are the same.
countIdenticalConsecutive([], 0).
countIdenticalConsecutive([_], 0).
countIdenticalConsecutive([X, X | T], N) :- countIdenticalConsecutive([X | T], M), N is M + 1.
countIdenticalConsecutive([X, Y | T], N) :- countIdenticalConsecutive([Y | T], N), X \= Y.

% Alphabetical distance between two answer letters.
charDist(A, B, N) :- charValue(A, X), charValue(B, Y), N is abs(X - Y).
charValue(a, 0).
charValue(b, 1).
charValue(c, 2).
charValue(d, 3).
charValue(e, 4).

% Problem constraints are not in order as it may slow the search
solve(ANS) :-
    length(ANS, 20),
    allAnswers(ANS),
    p1(ANS),
    p2(ANS),
    p3(ANS),
    p4(ANS),
    p5(ANS),
    p6(ANS),
    p7(ANS),
    p8(ANS),
    p9(ANS),
    p10(ANS),
    p11(ANS),
    p12(ANS),
    p13(ANS),
    p14(ANS),
    p15(ANS),
    p16(ANS),
    p17(ANS),
    p18(ANS),
    p19(ANS),
    p20(ANS).

p1([A1, A2, A3, A4, A5 | _]) :-
    A1 = a, A1 = b;
    A1 = b, A2 = b, dif(A1, b);
    A1 = c, A3 = b, dif(A1, b), dif(A2, b);
    A1 = d, A4 = b, dif(A1, b), dif(A2, b), dif(A3, b);
    A1 = e, A5 = b, dif(A1, b), dif(A2, b), dif(A3, b), dif(A4, b).

p2(L) :-
    [_, A2, _, _, _, A6, A7, A8, A9, A10, A11 | _] = L,
    countIdenticalConsecutive(L, 1),
    p2Help(A2, A6, A7, A8, A9, A10, A11).
p2Help(a, X, X, _, _, _, _).
p2Help(b, _, X, X, _, _, _).
p2Help(c, _, _, X, X, _, _).
p2Help(d, _, _, _, X, X, _).
p2Help(e, _, _, _, _, X, X).

p3(L) :- nth1(3, L, A3), count(L, e, N), p3Help(A3, N).
p3Help(a, 0).
p3Help(b, 1).
p3Help(c, 2).
p3Help(d, 3).
p3Help(e, 4).

p4(L) :- nth1(4, L, A4), count(L, a, N), p4Help(A4, N).
p4Help(a, 4).
p4Help(b, 5).
p4Help(c, 6).
p4Help(d, 7).
p4Help(e, 8).

p5([A1, A2, A3, A4, A5 | _]) :-
    A1 = A5, A5 = a;
    A2 = A5, A5 = b;
    A3 = A5, A5 = c;
    A4 = A5, A5 = d;
    A5 = A5, A5 = e.

% Answer to 6 cannot be E -- doesn't make sense
p6(L) :- nth1(6, L, A6), nth1(17, L, A17), p6Help(A6, A17).
p6Help(a, c).
p6Help(b, d).
p6Help(c, e).
p6Help(d, a).
p6Help(d, b).

p7(L) :- nth1(7, L, A7), nth1(8, L, A8), charDist(A7, A8, N), p7Help(A7, N).
p7Help(a, 4).
p7Help(b, 3).
p7Help(c, 3).
p7Help(d, 1).
p7Help(e, 0).

p8(L) :- nth1(8, L, A8), countVowels(L, N), p8Help(A8, N).
p8Help(a, 4).
p8Help(b, 5).
p8Help(c, 6).
p8Help(d, 7).
p8Help(e, 8).

p9([_, _, _, _, _, _, _, _,
    A9, A10, A11, A12, A13, A14 | _]) :-
    A9 = a, A10 = A9;
    A9 = b, A11 = A9, dif(A10, A9);
    A9 = c, A12 = A9, dif(A10, A9), dif(A11, A9);
    A9 = d, A13 = A9, dif(A10, A9), dif(A11, A9), dif(A12, A9);
    A9 = e, A14 = A9, dif(A10, A9), dif(A11, A9), dif(A12, A9), dif(A13, A9).

p10(L) :- nth1(10, L, A10), nth1(16, L, A16), p10Help(A10, A16).
p10Help(a, d).
p10Help(b, a).
p10Help(c, e).
p10Help(d, b).
p10Help(e, c).

p11([A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11 | _]) :-
    count([A1, A2, A3, A4, A5, A6, A7, A8, A9, A10], b, N),
    p11Help(A11, N).
p11Help(a, 0).
p11Help(b, 1).
p11Help(c, 2).
p11Help(d, 3).
p11Help(e, 4).

p12(L) :- nth1(12, L, A12), countConsonants(L, N), p12Help(A12, N).
p12Help(a, N) :- 0 is mod(N, 2).
p12Help(b, N) :- 1 is mod(N, 2).
p12Help(c, N) :- perfectSquare(N).
p12Help(d, N) :- prime(N).
p12Help(e, N) :- 0 is mod(N, 5).
perfectSquare(1).
perfectSquare(4).
perfectSquare(9).
perfectSquare(16).
prime(2).
prime(3).
prime(5).
prime(7).
prime(11).
prime(13).
prime(17).
prime(19).

p13([A1, _,  A3, _,  A5, _,  A7, _, A9, _, A11, _, A13, _, A15, _, A17, _, A19, _]) :-
    count([A1, A3, A5, A7, A9, A11, A13, A15, A17, A19], a, 1),
    p13Help(A9, A11, A13, A15, A17).
p13Help(a, _, a, _, _).
p13Help(_, a, b, _, _).
p13Help(_, _, c, _, _) :- c = a.
p13Help(_, _, d, a, _).
p13Help(_, _, e, _, a).

p14(L) :- nth1(14, L, A14), count(L, d, N), p14Help(A14, N).
p14Help(a, 6).
p14Help(b, 7).
p14Help(c, 8).
p14Help(d, 9).
p14Help(e, 10).

p15(L) :- nth1(15, L, A15), nth1(12, L, A12), A15 = A12.

p16(L) :- nth1(10, L, A10), nth1(16, L, A16), p16Help(A16, A10).
p16Help(a, d).
p16Help(b, c).
p16Help(c, b).
p16Help(d, a).
p16Help(e, e).

% Answer to 17 cannot be E -- doesn't make sense
p17(L) :- nth1(6, L, A6), nth1(17, L, A17), p17Help(A17, A6).
p17Help(a, c).
p17Help(b, d).
p17Help(c, e).
p17Help(d, a).
p17Help(d, b).

p18(L) :-
    nth1(18, L, A18),
    count(L, a, NA),
    count(L, b, NB),
    count(L, c, NC),
    count(L, d, ND),
    count(L, e, NE),
    p18Help(A18, NA, NB, NC, ND, NE).
p18Help(a, NA, NB, _, _, _) :- NA = NB.
p18Help(b, NA, _, NC, _, _) :- NA = NC.
p18Help(c, NA, _, _, ND, _) :- NA = ND.
p18Help(d, NA, _, _, _, NE) :- NA = NE.
p18Help(e, NA, NB, NC, ND, NE) :-
    dif(NA, NB), dif(NA, NC), dif(NA, ND), dif(NA, NE).

p19(L) :- nth1(19, L, X), answer(X).

% I assume the answer he was looking for is E
p20(L) :- nth1(20, L, e).
