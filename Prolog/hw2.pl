
any_positive([First|Rest]):-
  First>0;
  any_positive(Rest).

stack(Element,Filo,[Element|Filo]).
equals(Filo,Filo).

append([],X,X).
append([X|L1],L2,[X|L3]):-
        append(L1,L2,L3).

invert([],[]).
invert([First|Rest],X):-
  invert(Rest,X1),
  append(X1, [First], X).

substitute(_X,_Y,[],[]).
substitute(X,Y,[First|Rest],R):-
  substitute(X,Y,Rest,R1),
  X =:= First,
  stack(Y, R1, R);
  substitute(X,Y,Rest,R1),
  stack(First, R1, R).

less_than(_X,[],[]).
less_than(X,[First|Rest],R):-
  less_than(X,Rest,R1),
  X > First,
  stack(First, R1, R);
  less_than(X,Rest,R1),
  equals(R1, R).

more_than(_X,[],[]).
more_than(X,[First|Rest],R):-
  more_than(X,Rest,R1),
  X =< First,
  stack(First, R1, R);
  more_than(X,Rest,R1),
  equals(R1, R).

member(X, [X|_]).
member(X, [_First|Rest]):-
  member(X,Rest).

eliminate_duplicate([X|[]],[X|[]]).
eliminate_duplicate([First|Rest],R):-
  eliminate_duplicate(Rest,R1),
  member(First,R1),
  equals(R1, R);
  eliminate_duplicate(Rest,R1),
  stack(First, R1, R).

intersect([X|[]],_L2,[X|[]]).
intersect([First|Rest],L2,R):-
  intersect(Rest,L2,R1),
  member(First,L2),
  stack(First, R1, R);
  intersect(Rest,L2,R1),
  equals(R1, R).

rotate([First|Rest],X,R):-
  rotatea([First|Rest],X,1,R).

rotatea([First|Rest],X,Acum,R):-
  X=:=Acum,
  equals([First|Rest],R);
  Acum1 is Acum + 1,
  rotatea(Rest,X,Acum1,R1),
  append(R1,[First],R).

can_get_to(X,Y):-
    road(X,Y);
    road(X,Z),
    road(Z,Y);
    road(Y,X);
    road(Z,X),
    road(Y,Z).
