:- dynamic caminho/3.

mapa(m1, 3, 3).
% mapa(m2, 5, 5).
% mapa(special, 10, 10).


sala(m1, 0 , 0 , entrada).
sala(m1, 0 , 1 , passagem).
sala(m1, 0 , 2 , passagem).
sala(m1, 1 , 1 , passagem).
sala(m1, 2 , 0 , passagem).
sala(m1, 2 , 1 , passagem).
sala(m1, 2 , 2 , saida).

% mapa(m2, 5, 5).

% sala(m2, 0, 0, entrada).
% sala(m2, 0, 1, passagem).
% sala(m2, 0, 2, passagem).

% sala(m2, 0, 3, passagem).
% sala(m2, 1, 0, passagem).
% sala(m2, 1, 3, passagem).
% sala(m2, 1, 4, passagem).
% sala(m2, 2, 0, passagem).
% sala(m2, 2, 1, passagem).
% sala(m2, 2, 4, passagem).
% sala(m2, 3, 1, passagem).
% sala(m2, 3, 3, passagem).
% sala(m2, 3, 4, passagem).
% sala(m2, 4, 0, passagem).
% sala(m2, 4, 1, passagem).
% sala(m2, 4, 3, saida).

% mapa(special, 10, 10).

% sala(special, 4, 4, entrada).

% sala(special, 0, 0, passagem).
% sala(special, 0, 4, passagem).
% sala(special, 0, 5, passagem).
% sala(special, 0, 6, passagem).
% sala(special, 0, 7, passagem).
% sala(special, 0, 8, passagem).
% sala(special, 0, 9, passagem).

% sala(special, 1, 0, passagem).
% sala(special, 1, 1, passagem).
% sala(special, 1, 4, passagem).
% sala(special, 1, 9, passagem).

% sala(special, 2, 0, passagem).
% sala(special, 2, 4, passagem).
% sala(special, 2, 6, passagem).
% sala(special, 2, 7, passagem).
% sala(special, 2, 8, passagem).
% sala(special, 2, 9, passagem).

% sala(special, 3, 0, passagem).
% sala(special, 3, 2, passagem).
% sala(special, 3, 3, passagem).
% sala(special, 3, 4, passagem).
% sala(special, 3, 6, passagem).
% sala(special, 3, 9, passagem).

% sala(special, 4, 0, passagem).
% sala(special, 4, 1, passagem).
% sala(special, 4, 2, passagem).
% sala(special, 4, 6, passagem).
% sala(special, 4, 7, passagem).
% sala(special, 4, 8, passagem).
% sala(special, 4, 9, passagem).

% sala(special, 5, 4, passagem).
% sala(special, 5, 9, passagem).

% sala(special, 6, 0, passagem).
% sala(special, 6, 1, passagem).
% sala(special, 6, 2, passagem).
% sala(special, 6, 4, passagem).
% sala(special, 6, 5, passagem).
% sala(special, 6, 6, passagem).
% sala(special, 6, 7, passagem).
% sala(special, 6, 9, passagem).

% sala(special, 7, 0, passagem).
% sala(special, 7, 2, passagem).
% sala(special, 7, 3, passagem).
% sala(special, 7, 4, passagem).
% sala(special, 7, 7, passagem).
% sala(special, 7, 9, passagem).

% sala(special, 8, 4, passagem).
% sala(special, 8, 7, passagem).
% sala(special, 8, 9, passagem).

% sala(special, 9, 0, passagem).
% sala(special, 9, 1, passagem).
% sala(special, 9, 2, passagem).
% sala(special, 9, 3, passagem).
% sala(special, 9, 4, passagem).
% sala(special, 9, 6, passagem).
% sala(special, 9, 7, passagem).


% sala(special, 9, 9, saida).

escape(Map, Path) :-
    sala(Map, X, Y, entrada),
    walk(Map, X, Y,[], Path).

walk(Map,X,Y,Walked, Path):-
  sala(Map, X, Y,saida).
walk(Map, X, Y, Walked, Path):-
  N is Y - 1,
  S is Y + 1,
  L is X + 1,
  O is X - 1,
  sala(Map, X, Y, _),
  not(member((X,Y), Walked)),
  walk(Map,X,N,[(X,N)|Walked],Path),
  walk(Map,X,S,[(X,S)|Walked],Path),
  walk(Map,L,Y,[(L,Y)|Walked],Path),
  walk(Map,O,Y,[(O,Y)|Walked],Path).