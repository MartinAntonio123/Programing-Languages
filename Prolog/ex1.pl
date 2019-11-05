dad(billy, bob).
dad(bob, sue).
dad(bob, alex).
dad(alex, john).
dad(john, pete).
dad(pete, jack).
mom(ana, erika).
mom(sue, sussy).
mom(ana, billy).

antecesor_male(Ant, Dec):-
    dad(Ant, Dec);
    dad(Ant, Z),
    antecesor_male(Z, Dec).


hobby(juan,kaggle).
hobby(luis,hack).
hobby(elena,tennis).
hobby(midori,videogame).
hobby(simon,sail).
hobby(simon,kaggle).
hobby(laura,hack).
hobby(hans,videogame). 

compatible(X,Y):-
    hobby(X,Z),
    hobby(Y,Z).
