% codos(color)
% caños(color, longitud)
% canillas(tipo, color, ancho)

codo(Color).
codo(rojo).

canio(Color, Longitud).
canio(rojo, 3).

canilla(Tipo, Color, Ancho).
canilla(triangular, rojo, 4).

precio(Canieria,Precio) :-
    precio(codo(Color), 5).

precio(Canieria,Precio) :-
    precio(canio(Color, Longitud), (3*Longitud)).

precio(Canieria,Precio) :-
    precio(canilla(triangular, Color, Ancho), 20).

precio(Canieria,Precio) :-
    precio(canilla(Tipo, Color, Ancho), 12),
    Ancho =< 5.

precio(Canieria,Precio) :-
    precio(canilla(Tipo, Color, Ancho), 15),
    Ancho > 5.