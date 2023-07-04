padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).
madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).

%
pareja(Padre, Madre) :- 
    madreDe(Madre, Alguien),
    padreDe(Padre, Alguien).

%
tieneHijo(Personaje) :- padreDe(Personaje, Hijo).
tieneHijo(Personaje) :- madreDe(Personaje, Hijo).

%
hermanos(Uno, Otro) :- 
        padreDe(Papa, Uno),
        padreDe(Papa, Otro),
        madreDe(Mama, Uno),
        madreDe(Mama, Otro).

%
medioHermanos(Uno, Otro) :- 
        padreDe(Papa, Uno),
        padreDe(Papa, Otro).
medioHermanos(Uno,Otro) :-
        madreDe(Mama, Uno),
        madreDe(Mama, Otro).

%
tioDe(Tio, Sobrino) :- 
    padreDe(Papa, Sobrino),
    hermanos(Papa, Tio).

tioDe(Tio, Sobrino) :- 
    padreDe(Papa, Sobrino),
    medioHermanos(Papa, Tio).

tioDe(TioPostizo, Sobrino) :- 
    padreDe(Papa, Sobrino),
    medioHermanos(Papa, Tio),
    pareja(Tio, TioPostizo).

tioDe(TioPostizo, Sobrino) :- 
    padreDe(Papa, Sobrino),
    hermanos(Papa, Tio),
    pareja(Tio, TioPostizo).

%
abueloMultiple(Abuelo) :-
    padreDe(Abuelo, Padre),
    padreDe(Padre, Hijo),
    padreDe(Padre, OtroHijo).

abueloMultiple(Abuelo) :-
    padreDe(Abuelo, Padre),
    madreDe(Padre, Hijo),
    madreDe(Padre, OtroHijo).

abueloMultiple(Abuelo) :-
    madreDe(Abuelo, Padre),
    padreDe(Padre, Hijo),
    padreDe(Padre, OtroHijo).

abueloMultiple(Abuelo) :-
    madreDe(Abuelo, Padre),
    madreDe(Padre, Hijo),
    madreDe(Padre, OtroHijo).

%
cunados(Uno, Otro) :- 
    pareja(Uno, Pareja),
    hermanos(Otro, Pareja).

%
suegros(Uno, Otro) :-
    pareja(Uno, Pareja),
    padreDe(Otro, Pareja).

%
primos(Uno, Otro) :-
    padreDe(Padre, Uno),
    padreDe(Padre2,Otro),
    hermanos(Padre,Padre2).

%
descendiente(Uno, Otro) :-
    padreDe(Otro,Uno).

descendiente(Uno, Otro) :-
    padreDe(Padre, Uno),
    descendiente(Padre, Otro).