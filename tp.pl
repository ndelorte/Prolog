numero(0).
numero(1).
numero(2).
numero(3).
numero(4).
numero(6).
numero(7).
numero(8).
numero(9).

color(blanco).
color(negro).

ficha(Numero, Color):-
    numero(Numero),
    color(Color).

ficha(5,verde).



jugador(nicolas, [ficha(8,negro),ficha(5,verde),ficha(0,blanco),ficha(2,negro),ficha(2,blanco)]).

conocerCodigo(Jugador, CodigoJugador):-
    jugador(Jugador, Fichas),
    sort(Fichas, CodigoJugador).

% codigoValidoAdversarios(Jugador,CodigosPosibles):-
%     todosCodigosPosibles(Codigos),
%     conocerCodigo(Jugador,CodigoJugador),
%     forall((member(Ficha,CodigoJugador),not(esVerde(Ficha))), not(member(Ficha,Codigos))),
%     sort(Codigos, CodigosPosibles).

% esVerde(ficha(_,verde)).

% todosCodigosPosibles([ficha(Numero1,Color1),ficha(Numero2,Color2),ficha(Numero3,Color3),ficha(Numero4,Color4),ficha(Numero5,Color5)]):-
%     distintosNumeros(Numero1,Numero2,Numero3,Numero4,Numero5).

% todosCodigosPosibles([ficha(Numero1,Color1),ficha(Numero2,Color2),ficha(Numero3,Color3),ficha(Numero4,Color4),ficha(Numero5,Color5)]):-
%     siSonIguales(Numero1,Numero2,Numero3,Numero4,Numero5,Color1,Color2,Color3,Color4,Color5).


% distintosNumeros(Num1,Num2,Num3,Num4,Num5):-
%     Num1 \= Num2,
%     Num1 \= Num3,
%     Num1 \= Num4,
%     Num1 \= Num5,
%     Num2 \= Num3,
%     Num2 \= Num4,
%     Num2 \= Num5,
%     Num3 \= Num4,
%     Num3 \= Num5,
%     Num4 \= Num5.

% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N1=N2,
%     C1\=C2.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N1=N3,
%     C1\=C3.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N1=N4,
%     C1\=C4.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N1=N5,
%     C1\=C5.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N2=N3,
%     C2\=C3.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N2=N4,
%     C2\=C4.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N2=N5,
%     C2\=C5.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N3=N4,
%     C3\=C4.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N3=N5,
%     C3\=C5.
% siSonIguales(N1,N2,N3,N4,N5,C1,C2,C3,C4,C5):-
%     N4=N5,
%     C4\=C5.

combinacionesPosiblesFichas(Ficha1,Ficha2,Ficha3,Ficha4,Ficha5):-
    findall(ficha(Numero,Color), ficha(Numero,Color), FichasPosibles),   
    member(Ficha1,FichasPosibles),
    member(Ficha2,FichasPosibles),
    member(Ficha3,FichasPosibles),
    member(Ficha4,FichasPosibles),
    member(Ficha5,FichasPosibles),
    distintosFichas(Ficha1,Ficha2,Ficha3,Ficha4,Ficha5).    
    
distintosFichas(Num1,Num2,Num3,Num4,Num5):-
    Num1 \= Num2,
    Num1 \= Num3,
    Num1 \= Num4,
    Num1 \= Num5,
    Num2 \= Num3,
    Num2 \= Num4,
    Num2 \= Num5,
    Num3 \= Num4,
    Num3 \= Num5,
    Num4 \= Num5.