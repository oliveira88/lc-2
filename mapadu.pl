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

printaBorda(0).
printaBorda(X) :-
    X > 0,
    write("---"),
    Z is X-1,
    printaBorda(Z).

printaNumeros(0) :-
    write(0),
    write("  ").

printaNumeros(X) :-
    X > 0,
    Z is X-1,
    printaNumeros(Z),
    write(X),
    write("  ").

printaEntrada(X, Y, Mapa) :-
(sala(Mapa, X, Y, entrada)
        -> write("E"); write("")).

printaPassagem(X, Y, Mapa) :-
(sala(Mapa, X, Y, passagem)
-> write("   "); write("")).

printaSaida(X, Y, Mapa) :-
(sala(Mapa, X, Y, saida)
-> write("S"); write("")).

prtParede(X, Y, Mapa) :-
(\+ sala(Mapa, X, Y, _)
-> write("###"); write("")).

printaLinha(0, Y, Mapa) :-
    write(Y),
    write("|"),
    printaEntrada(0, Y, Mapa),
    printaPassagem(0, Y, Mapa),
    printaSaida(0, Y, Mapa),
    prtParede(0, Y, Mapa).

printaLinha(X, Y, Mapa) :-
    X > 0,
    Z is X-1,
    printaLinha(Z, Y, Mapa),
    printaEntrada(X, Y, Mapa),
    printaPassagem(X, Y, Mapa),
    printaSaida(X, Y, Mapa),
    prtParede(X, Y, Mapa).

printaMapa(X, 0, Mapa) :-
    printaLinha(X, 0, Mapa),
    writeln("|").

printaMapa(X, Y, Mapa) :-
    Y > 0,
    Z is Y-1,
    printaMapa(X, Z, Mapa),
    printaLinha(X, Y, Mapa),
    writeln("|").

printaLabirinto() :-
    mapa(Mapa, A, B),
    C is A - 1,
    D is B - 1,
    write(" X "),
    printaNumeros(C),
    writeln(""),
    write("Y+"),
    printaBorda(A),
    writeln("+"),
    printaMapa(C, D, Mapa),
    write(" +"),
    printaBorda(A),
    write("+").