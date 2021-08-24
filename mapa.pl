mapa(m1, 3, 3).
sala(m1, 0, 0, entrada).
sala(m1, 0, 1, passagem).
sala(m1, 0, 2, passagem).
sala(m1, 1, 1, passagem).
sala(m1, 2, 0, passagem).
sala(m1, 2, 1, passagem).
sala(m1, 2, 2, saida).
%-----------------------------
printAsc(0) :-
  write(0),
  write("  ").
printAsc(X) :-
  X > 0,
  Y is X - 1,
  printAsc(Y),
  write(X ),
  write("  ").

printlnAsc(X,0) :-
  debugador(X,0),

  write(0),
  write("|"),
  printCaminho(X,0),
  writeln("").
printlnAsc(X, Y) :-
  Y > 0,
  debugador(X,Y),
  Y1 is Y - 1,
  printlnAsc(X, Y1),
  write(Y),
  write("|"),
  printCaminho(X,Y),
  writeln("").


printaHorizontal(0):-
  write("---").
printaHorizontal(X) :-
  write("---"),
  Y is X-1,
  printaHorizontal(Y).

printTipoColisao(X,Y) :-
  sala(_, X, Y, Z),
  (Z = entrada -> write("_E_"); write("")),
  (Z = passagem -> write("  "); write("")),
  (Z = saida -> write("_S_"); write("")),
  (\+ sala(_, X, Y, _) -> write("XXX"); write("")).

printEntrada(X,Y) :-
  (sala(_, X, Y, entrada) -> write("_E_"); write("")).
printPassagem(X,Y) :-
  (sala(_, X, Y, passagem) -> write("   "); write("")). 
printSaida(X,Y) :-
  (sala(_, X, Y, saida) -> write("_S_"); write("")).
printParede(X,Y) :-
  (\+ sala(_, X, Y, _) -> write("XXX"); write("")).

printCaminho(X,Y) :-
  printEntrada(X,Y), printPassagem(X,Y), printSaida(X,Y), printParede(X,Y).



exec() :- 
  mapa(m1,X1, Y1),
  X is X1 - 1,
  Y is Y1 - 1,
  write(" X "),
  printAsc(X),
  writeln(""),
  write("Y+"),
  printaHorizontal(X),
  writeln("+"),
  printlnAsc(X,Y).

achar([X, Y, Z]) :-
  sala(_, X, Y, Z).


testaIf(X) :-
  (X = 1 -> write("_E_"); write("")),
  (X = 2 -> write("  "); write("")),
  (X = 3 -> write("_S_"); write("")).


debugador(X,Y) :-
  write("debugando "),
  write("x: "),
  write(X),
  write("y: "),
  writeln(Y).