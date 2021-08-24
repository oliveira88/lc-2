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
mapa(m1, 3, 3).

sala(m1, 0 , 0 , entrada).
sala(m1, 0 , 1 , passagem).
sala(m1, 0 , 2 , passagem).
sala(m1, 1 , 1 , passagem).
sala(m1, 2 , 0 , passagem).
sala(m1, 2 , 1 , passagem).
sala(m1, 2 , 2 , saida).



procurarCaminho(Mapa):-
	sala( Mapa, X, Y, entrada ),
	andar(Mapa, X, Y).

:- dynamic sala/4.
	
andar(Mapa, X,LINHA):-
	sala(Mapa, X, LINHA, saida).

andar(Mapa,X,LINHA) :- verificaN(Mapa, X, LINHA), %Norte
	assert(sala(Mapa, X, LINHA, n)),
	NovaLINHA is LINHA-1,
	andar(Mapa,X,NovaLINHA).

andar(Mapa,X,LINHA) :- verificaL(Mapa, X, LINHA), %Leste
	assert(sala(Mapa, X, LINHA, l)),
	NovaCOLUNA is X+1,
	andar(Mapa,NovaCOLUNA,LINHA).

andar(Mapa,X,LINHA) :- verificaS(Mapa, X, LINHA), %Sul
	assert(sala(Mapa, X, LINHA, s)),
	NovaLINHA is LINHA+1,
	andar(Mapa,X,NovaLINHA).

andar(Mapa,X,LINHA) :- verificaO(Mapa, X, LINHA), %Oeste
	assert(sala(Mapa, X, LINHA, o)),
	NovaCOLUNA is X-1,
	andar(Mapa,NovaCOLUNA,LINHA).



verificaN(Mapa,COLUNA,LINHA):- NovaLINHA is LINHA-1,
	sala(Mapa, COLUNA, NovaLINHA, _),
	not(sala(Mapa, COLUNA, NovaLINHA, s)),
	nl,
	write("Norte->"),
	write("["),
	write(COLUNA),
	write(","),
	write(NovaLINHA),
	write("]").

verificaL(Mapa,COLUNA,LINHA):- NovaCOLUNA is COLUNA+1,
	sala(Mapa, NovaCOLUNA, LINHA, _),
	not(sala(Mapa, NovaCOLUNA, LINHA, o)),
	nl,
	write("Leste->"),
	write("["),
	write(NovaCOLUNA),
	write(","),
	write(LINHA),
	write("]").

verificaS(Mapa,COLUNA,LINHA):- NovaLINHA is LINHA+1,
	sala(Mapa, COLUNA, NovaLINHA, _),
	not(sala(Mapa, COLUNA, NovaLINHA, n)),
	nl,
	write("Sul->"),
	write("["),
	write(COLUNA),
	write(","),
	write(NovaLINHA),
	write("]").

verificaO(Mapa,COLUNA,LINHA):- NovaCOLUNA is COLUNA-1,
	sala(Mapa, NovaCOLUNA, LINHA, _),
	not(sala(Mapa, NovaCOLUNA, LINHA, l)),
	nl,
	write("Oeste->"),
	write("["),
	write(NovaCOLUNA),
	write(","),
	write(LINHA),
	write("]").

t(X, Y) :-
	t([(X|Y)],Y).