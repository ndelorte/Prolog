tarea(basico,buscar(libro,jartum)).
tarea(basico,buscar(arbol,patras)).
tarea(basico,buscar(roca,telaviv)).
tarea(intermedio,buscar(arbol,sofia)).
tarea(intermedio,buscar(arbol,bucarest)).
tarea(avanzado,buscar(perro,bari)).
tarea(avanzado,buscar(flor,belgrado)).

nivelActual(pepe,basico).
nivelActual(lucy,intermedio).
nivelActual(juancho,avanzado).

idioma(alejandria,arabe).
idioma(jartum,arabe).
idioma(patras,griego).
idioma(telaviv,hebreo).
idioma(sofia,bulgaro).
idioma(bari,italiano).
idioma(bucarest,rumano).
idioma(belgrado,serbio).

habla(pepe,bulgaro).
habla(pepe,griego).
habla(pepe,italiano).
habla(juancho,arabe).
habla(juancho,griego).
habla(juancho,hebreo).
habla(lucy,griego).

capital(pepe,1200).
capital(lucy,3000).
capital(juancho,500).



% Punto 01

destinoPosible(Persona,Ciudad) :-
    nivelActual(Persona, Nivel),
    tarea(Nivel, buscar(_,Ciudad)).

idiomaUtil(Nivel, Idioma) :-
    tarea(Nivel, buscar(_,Ciudad)),
    idioma(Ciudad, Idioma).

% Punto 02

excelenteCompaniero(Participante1, Participante2) :-
    nivelActual(Participante1, Nivel),
    forall(idiomaUtil(Nivel, Idioma), habla(Participante2, Idioma)).

% Punto 03

interesante(Nivel) :-
    forall(tarea(Nivel, buscar(Cosa,_)), estaVivo(Cosa)).

estaVivo(arbol).
estaVivo(perro).
estaVivo(flor).

interesante(Nivel) :-
    tarea(Nivel, buscar(_, Lugar)),
    idioma(Lugar, italiano).

% Punto 04

complicado(Participante) :-
    nivelActual(Participante, Nivel),
    idiomaUtil(Nivel, Idioma),
    not(habla(Participante, Idioma)).

complicado(Participante) :-
    not(nivelActual(Participante, basico)),
    capital(Participante, Capital),
    Capital < 1500.

complicado(Participante) :-
    nivelActual(Participante, basico),
    capital(Participante, Capital),
    Capital < 500.

% Punto 05

homogeneo(Nivel) :-
    tarea(Nivel,buscar(Cosa,_)),
    forall(tarea(Nivel, buscar(OtraCosa, _)), mismaCosa(Cosa, OtraCosa)).

mismaCosa(UnaCosa, UnaCosa).










