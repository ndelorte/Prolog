%jugador(Nombre,Rating,Civilizacion)
%tiene(Nombre,QueTiene)

jugador(juli, 2200, jemeres).
jugador(aleP, 1600, mongoles).
jugador(feli, 500000, persas).
jugador(aleC, 1723, otomanos).
jugador(ger, 1729, ramanujanos).
jugador(juan, 1515, britones).
jugador(marti, 1342, argentinos).

tiene(aleP, unidad(samurai, 199)).
tiene(aleP, unidad(espadachin, 10)).
tiene(aleP, unidad(granjero, 10)).
tiene(aleP, recurso(800, 300, 100)).
tiene(aleP, edificio(casa, 40)).
tiene(aleP, edificio(castillo, 1)).
tiene(juan, unidad(carreta, 10)).

%militar(Tipo,Costo(Madera,Alimento,Oro),Categoria)
%aldeanos(Tipo,produce(Madera,Alimento,Oro))

militar(espadachin, costo(0, 60, 20), infanteria).
militar(arquero, costo(25, 0, 45), arqueria).
militar(mangudai, costo(55, 0, 65), caballeria).
militar(samurai, costo(0, 60, 30), unica).
militar(keshik, costo(0, 80, 50), unica).
militar(tarcanos, costo(0, 60, 60), unica).
militar(alabardero, costo(25, 35, 0), piquero).

aldeano(lenador, produce(23, 0, 0)).
aldeano(granjero, produce(0, 32, 0)).
aldeano(minero, produce(0, 0, 23)).
aldeano(cazador, produce(0, 25, 0)).
aldeano(pescador, produce(0, 23, 0)).
aldeano(alquimista, produce(0, 0, 25)).

%edificio(Edificio,costo(Madera,Alimento,Oro))

edificio(casa, costo(30, 0, 0)).
edificio(granja, costo(0, 60, 0)).
edificio(herreria, costo(175, 0, 0)).
edificio(castillo, costo(650, 0, 300)).
edificio(maravillaMartinez, costo(10000, 10000, 10000)).



%--1

esUnAfano(Jugador1,Jugador2):-
    jugador(Jugador1,Rating1,_),
    jugador(Jugador2,Rating2,_),
    (Rating1-Rating2)>500.

%--2

esEfectivo(caballeria,arqueria).
esEfectivo(arqueria,infanteria).
esEfectivo(infanteria,piquetero).
esEfectivo(piquetero,caballeria).
esEfectivo(samurai,Unica):-
    militar(Unidad,_,unica).

%--3

alarico(Jugador):-
    tiene(Jugador,unidad(Unidad,_)),
    militar(Unidad,_,infanteria).

%--4

leonidas(Jugador):-
    tiene(Jugador,unidad(Unidad,_)),
    militar(Unidad,_,piquero).

%--5

nomada(Jugador):-
    not(tiene(Jugador,edificio(casa,_))).

%--6

cuantoCuesta(UnidadEdificio,costo(Madera,Alimento,Oro)):-
    militar(UnidadEdificio,costo(Madera,Alimento,Oro),_).

cuantoCuesta(UnidadEdificio,costo(Madera,Alimento,Oro)):-
    edificio(UnidadEdificio,costo(Madera,Alimento,Oro)).

cuantoCuesta(UnidadEdificio,costo(0,50,0)):-
    aldeano(UnidadEdificio,_).

cuantoCuesta(carreta,costo(100,0,50)).
cuantoCuesta(urnaMercante,costo(100,0,50)).

%--7

produccion(Unidad,produce(Madera,Alimento,Oro)):-
    aldeano(Unidad,produce(Madera,Alimento,Oro)).

produccion(carreta,produce(0,0,32)).
produccion(urnaMercante,produce(0,0,32)).
produccion(keshiks,produce(0,0,10)).

%--8

produccionTotal(Jugador,Recurso,ProduccionTotal):-
    jugador(Jugador,_,_),
    sumatoriaRecurso(Jugador,Recurso,Producciontotal).

sumatoriaRecurso(Jugador,madera,ProduccionTotal):-
    tiene(Jugador,unidad(Unidad,Cantidad)),
    findall(Madera*Cantidad,produccion(Unidad,produce(Madera,_,_)),Valores),
    sum_list(Valores, ProduccionTotal).

sumatoriaRecurso(Jugador,alimento,ProduccionTotal):-
    tiene(Jugador,unidad(Unidad,Cantidad)),
    findall(Alimento*Cantidad,produccion(Unidad,produce(_,Alimento,_)),Valores),
    sum_list(Valores, ProduccionTotal).

sumatoriaRecurso(Jugador,madera,ProduccionTotal):-
    tiene(Jugador,unidad(Unidad,Cantidad)),
    findall(Oro*Cantidad,produccion(Unidad,produce(_,_,Oro)),Valores),
    sum_list(Valores, ProduccionTotal).


%--9

estaPeleado(Jugador1,Jugador2):-
    jugador(Jugador1,_,_),
    jugador(Jugador2,_,_),
    not(esUnAfano(Jugador1,Jugador2)),
    not(esUnAfano(Jugador2,Jugador1)),
    tienenMismaCantidadUnidades(Jugador1,Jugador2),
    diferenciaEntreProduccionMenorACien(Jugador1,Jugador2).

tienenMismaCantidadUnidades(Jugador1,Jugador2):-
    findall(unidad(_,_),tiene(Jugador1,unidad(_,_)),Unidades1),
    findall(unidad(_,_),tiene(Jugador2,unidad(_,_)),Unidades2),
    Unidades1=Unidades2.

diferenciaEntreProduccionMenorACien(Jugador1,Jugador2):-
    produccionTotal(Jugador1,oro,ProduccionTotalOro1),
    produccionTotal(Jugador1,madera,ProduccionTotalMadera1),
    produccionTotal(Jugador1,alimento,ProduccionTotalAlimento1),
    produccionTotal(Jugador2,oro,ProduccionTotalOro2),
    produccionTotal(Jugador2,madera,ProduccionTotalMadera2),
    produccionTotal(Jugador2,alimento,ProduccionTotalAlimento2),
    Valor1 is ((ProduccionTotalOro1*5)+(ProduccionTotalMadera1*3)+(ProduccionTotalAlimento1*2)),
    Valor2 is ((ProduccionTotalOro2*5)+(ProduccionTotalMadera2*3)+(ProduccionTotalAlimento2*2)),
    (Valor1-Valor2)<100,
    (Valor2-Valor1)<100.

%--10

avanzaA(Jugador,edadMedia).

avanzaA(Jugador,edadFeudal):-
    not(nomada(Jugador)),
    tiene(Jugador,recurso(_,Alimento,_)),
    Alimento>500.

avanzaA(Jugador,edadDeLosCastillos):-
    tiene(Jugador,recurso(_,Alimento,Oro)),
    Alimento>800,
    Oro>200,
    tieneEdificioNecesario(Jugador).

tieneEdificioNecesario(Jugador):-
    tiene(Jugador,edificio(herreria,_)).
tieneEdificioNecesario(Jugador):-
    tiene(Jugador,edificio(establo,_)).
tieneEdificioNecesario(Jugador):-
    tiene(Jugador,edificio(galeriaTiro,_)).

avanzaA(Jugador,edadImperial):-
    tiene(Jugador,recurso(_,Alimento,Oro)),
    Alimento>1000,
    Oro>800,
    tieneEdificioNecesarioPlus(Jugador).

tieneEdificioNecesarioPlus(Jugador):-
    tiene(Jugador,edificio(castillo,_)),
    tiene(Jugador,edificio(universidad,_)).