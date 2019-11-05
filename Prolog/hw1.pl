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

road(placentia, ariminum).
road(ariminum, ancona).
road(ancona, roma).
road(ancona, castrum).
road(castrum, roma).
road(messana, capua).
road(rhegium ,messana).
road(catina, rhegium).

can_get_to(X,Y):-
    road(X,Y);
    road(X,Z),
    road(Z,Y).

min(A, B, C, Z):-
    A > C,
    B > C,
    Z is C;
    A > B,
    C > B,
    Z is B;
    C > A,
    B > A,
    Z is A.

gcd(A,B,Z):-
    A=B,
    Z=A.
gcd(A,B,Z):-
    A<B,
    B1 is B-A,
    gcd(A,B1,Z).
gcd(A,B,Z):-
    A>B ,
    gcd(B,A,Z).
