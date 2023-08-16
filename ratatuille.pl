
viveEn(remy, gusteaus).
viveEn(emile, barMalabar).
viveEn(django, pizzeriaJeSuis).


cocina(linguini,ratatouille, 3).
cocina(linguini,sopa, 5).
cocina(colette,salmonAsado,9).
cocina(horst,ensaladaRusa,8).


trabaja(linguini,gusteaus).
trabaja(colette,gusteaus).
trabaja(horst,gusteaus).
trabaja(amelie,cafeDes2Moulins).

%--1

inspeccionSatisfactoria(Restaurant):-
    trabaja(_,Restaurant),
    not(viveEn(_,Restaurant)).

%--2

chef(Empleado,Restaurant):-
    trabaja(Empleado,Restaurant),
    cocina(Empleado,_,_).

%--3

chefcito(Rata):-
    viveEn(Rata,Lugar),
    trabaja(linguini,Lugar).

%--4

cocinaBien(Empleado,Plato):-
    cocina(Empleado,Plato,Exp),
    Exp>7.
cocinaBien(remy,_).

%--5

encargadoDe(Nombre,Plato,Lugar):-
    cocinaEn(Nombre,Plato,Lugar,ExpMax),
    forall(cocinaEn(_,Plato,Lugar,Exp), Exp=<ExpMax).

cocinaEn(Nombre,Plato,Lugar,Exp):-
    chef(Nombre,Lugar),
    cocina(Nombre,Plato,Exp).
    

%--

plato(ensaladaRusa,entrada([papa,zanahoria,arvejas,huevo,mayonesa])).
plato(bifeDeChorizo,principal(pure,25)).
plato(frutillasConCrema,postre(265)).

%--6

saludable(Plato):-
    plato(Plato,postre(Calorias)),
    Calorias<75.

saludable(Plato):-
    plato(Plato,entrada(Ingredientes)),
    length(Ingredientes, CantIngredientes),
    (CantIngredientes*15)<75.

saludable(Plato):-
    plato(Plato,principal(Guarnicion,MinutosCoccion)),
    sumaPlatoPrincipal(Guarnicion,MinutosCoccion,Suma),
    Suma<75.

sumaPlatoPrincipal(papasFritas,Mins,Suma):-
    Suma is 50+(Mins*5).
sumaPlatoPrincipal(pure,Mins,Suma):-
    Suma is 20+(Mins*5).
sumaPlatoPrincipal(ensalada,Mins,Suma):-
    Suma is 0+(Mins*5).


criticaPositiva(Restaurant,antonEgo):-
    inspeccionSatisfactoria(Restaurant),
    especialista(Restaurant,ratatouille).

especialista(Restaurant,Plato):-
    forall(chef(Chef,Restaurant), cocinaBien(Chef,Plato)).

criticaPositiva(Restaurant,christophe):-
    inspeccionSatisfactoria(Restaurant),
    findall(Nombre,trabaja(Nombre,Restaurant),ListaEmpleados),
    length(ListaEmpleados,Int),
    Int>3.

criticaPositiva(Restaurant,cormillot):-
    inspeccionSatisfactoria(Restaurant),
    chef(Empleado,Restaurant),
    cocina(Empleado,Platos,_),
    forall(Platos,saludable(Plato)),
    plato(Plato,entrada(_)).
