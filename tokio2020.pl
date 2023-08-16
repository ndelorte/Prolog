% atleta(Nombre,Edad,Pais,Disciplina).
% disciplina(Nombre,AtletaOEquipo).
% medalla(Material,Disciplina,EntregaA,Pais).
% evento(Discuplina,Ronda,Participantes,Pais).

%--1

atleta(pepe,43,argentina,saltoEnLargo).
atleta(messi,35,argentina,futbol).
atleta(delPotro,30,argentina,tenis).
disciplina(tenis,individual(delPotro)).
medalla(oro,tenis,individual(delPotro),argentina).
medalla(plata,tenis,individual(delPotro),argentina).
medalla(bronce,tenis,individual(delPotro),argentina).
evento(tenis,final,individual(delPotro),argentina).
evento(futbol,cuartos,equipo([messi,aguero,tevez]),argentina).
disciplina(futbol,equipo([messi,aguero,tevez])).
evento(saltoEnLargo,ronda1,individual(pepe),argentina).
evento(saltoEnLargo,ronda2,individual(pepe),argentina).


%--2

vinoAPasear(Atleta):-
    not(participa(Atleta)).
    
participa(Atleta):-
    atleta(Atleta,_,_,_),    
    disciplina(_,individual(Atleta)).
participa(Atleta):-  

    esMiembroDeEquipo(Atleta,_).

esMiembroDeEquipo(Atleta,Equipo):-
    atleta(Atleta,_,_,_), 
    disciplina(_,equipo(Equipo)), 
    member(Atleta,Equipo).

%--3

medallasPais(Disciplina,Medalla,Pais):-
    medalla(Medalla,Disciplina,_,Pais).

%--4

participoEn(Ronda,Disciplina,Atleta):-
    evento(Disciplina,Ronda,individual(Atleta),_).

participoEn(Ronda,Disciplina,Atleta):-
    evento(Disciplina,Ronda,equipo(Equipo),_),
    esMiembroDeEquipo(Atleta,Equipo).

%--5

dominio(Disciplina,Pais):-
    medalla(oro,Disciplina,individual(_),Pais),
    medalla(plata,Disciplina,individual(_),Pais),
    medalla(bronce,Disciplina,individual(_),Pais).

%--6

medallaRapida(Disciplina):-
    evento(Disciplina,rondaUnica,_,_).

%--7

noEsElFuerte(Pais,Disciplina):-
    not(atleta(_,_,Pais,Disciplina)).
noEsElFuerte(Pais,Disciplina):-
    participoEnRondaInicial(Pais,Disciplina).

participoEnRondaInicial(Pais,Disciplina):-
    evento(Disciplina,ronda1,individual(_),Pais),
    not((evento(Disciplina,Ronda,individual(_),Pais),
    Ronda\=ronda1)).

participoEnRondaInicial(Pais,Disciplina):-
   evento(Disciplina,faseDeGrupo,equipo(_),Pais),
    not((evento(Disciplina,Ronda,individual(_),Pais),
    Ronda\=faseDeGrupo)).

%--8

medallasEfectivas(SumaMedallas,Pais):-
    findall(Medalla,medalla(oro,_,_,Pais), Oros),
    findall(Medalla,medalla(plata,_,_,Pais), Platas),
    findall(Medallas,medalla(bronce,_,_,Pais), Bronces),
    length(Oros,CantOros),
    length(Platas,CantPlatas),
    length(Bronces,CantBronces),
    SumaMedallas is ((CantOros*3)+(CantPlatas*2)+CantBronces).

%--9

laEspecialidad(Atleta):-
    not(vinoAPasear(Atleta)),
    ningunaMedallaEsBronce(Atleta).

ningunaMedallaEsBronce(Atleta):-
    