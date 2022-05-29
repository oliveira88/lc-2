:- dynamic caminho/3.

mapa(m1, 3, 3).
mapa(m2, 5, 5).

sala(m1, 0 , 0 , entrada).
sala(m1, 0 , 1 , passagem).
sala(m1, 0 , 2 , passagem).
sala(m1, 1 , 1 , passagem).
sala(m1, 2 , 0 , passagem).
sala(m1, 2 , 1 , passagem).
sala(m1, 2 , 2 , saida).

sala(m2, 0, 0, entrada).
sala(m2, 0, 1, passagem).
sala(m2, 0, 2, passagem).
sala(m2, 0, 3, passagem).
sala(m2, 1, 0, passagem).
sala(m2, 1, 3, passagem).
sala(m2, 1, 4, passagem).
sala(m2, 2, 0, passagem).
sala(m2, 2, 1, passagem).
sala(m2, 2, 4, passagem).
sala(m2, 3, 1, passagem).
sala(m2, 3, 3, passagem).
sala(m2, 3, 4, passagem).
sala(m2, 4, 0, passagem).
sala(m2, 4, 1, passagem).
sala(m2, 4, 3, saida).

escape(Map) :-
    retractall(caminho(_, _, _)),
    sala(Map, X, Y, entrada),
    write("Entrada ("),
    write(X),
    write(,),
    write(Y),
    writeln(")"),
    walk(Map, X, Y),
    (caminho(A, B, C),
    write(A),
    write("-> ("),
    write(B),
    write(", "),
    write(C),
    write(")"));
    write("Achou a saida").


exclude(Dir, X, Y) :-
    retract(caminho(Dir, X, Y)).

and(L, R) :-
    L, R.

checkwall(Map, X, Y) :-
    N is Y - 1,
    S is Y + 1,
    O is X - 1,
    L is X + 1,
    (
        and(sala(Map, X, N, _), not(caminho(sul, X, Y)));
        and(sala(Map, L, Y, _), not(caminho(oeste, X, Y)));
        and(sala(Map, O, Y, _), not(caminho(leste, X, Y)));
        and(sala(Map, X, S, _), not(caminho(norte, X, Y)))
    ).

moonWalk(Map, X, Y, LastX, LastY, LastMove) :-
    N is Y - 1,
    S is Y + 1,
    O is X - 1,
    L is X + 1,
    (not(checkwall(Map, X, Y))
    -> (and(sala(Map, X, S, _), not(and(LastX == X, LastY == S))) %Sul
        -> moonWalk(Map, X, S, X, Y, sul), exclude(norte, X, Y);
            (and(sala(Map, O, Y, _), not(and(LastX == O, LastY == Y))) %Oeste
        -> moonWalk(Map,O, Y, X, Y, oeste), exclude(leste, X, Y);
            (and(sala(Map, X, N, _), not(and(LastX == X, LastY == N))) %Norte
        -> moonWalk(Map, X, N, X, Y, norte), exclude(sul, X, Y);
            (and(sala(Map, L, Y, _), not(and(LastX == L, LastY == Y))) %Leste
        -> moonWalk(Map, L, Y, X, Y, leste), exclude(oeste, X, Y))))
        );
        assert(caminho(LastMove, X, Y)),
        walk(Map, X, Y),
        exclude(LastMove, X, Y)
    ).

walk(Map, X, Y):-
    sala(Map, X, Y, saida).

walk(Map, X, Y) :-
    sala(Map, X, Y, Z),
(not(Z == saida) ->
    N is Y - 1,
    S is Y + 1,
    O is X - 1,
    L is X + 1,
    (and(sala(Map, X, S, _), not(caminho(norte, X, Y))) %Sul
    -> assert(caminho(sul, X, S)), walk(Map, X, S);
        (and(sala(Map, O, Y, _), not(caminho(leste, X, Y))) %Oeste
        -> assert(caminho(oeste, O, Y)), walk(Map, O, Y);
            (and(sala(Map, L, Y, _), not(caminho(oeste, X, Y))) %Leste
            -> assert(caminho(leste, L, Y)), walk(Map, L, Y);
                (and(sala(Map, X, N, _), not(caminho(sul, X, Y))) %Norte
                -> assert(caminho(norte, X, N)), walk(Map, X, N);
                    moonWalk(Map, X, Y, -1, -1, parado)))))).