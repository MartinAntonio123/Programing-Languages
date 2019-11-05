id_title(1,impala).
id_title(2,weezer).
id_title(3,louis).
id_title(4,martin).
id_title(5,drones).
id_title(6,hydras).
id_length(1,10).
id_length(2,15).
id_length(3,8).
id_length(4,30).
id_length(5,22).
id_length(6,19).
id_keyword(1,[a,b,c]).
id_keyword(2,[a,d]).
id_keyword(3,[b,c]).
id_keyword(4,[c,d]).
id_keyword(5,[a,h,k]).
id_keyword(6,[c,d,f,o]).
id_is_owner_w(1).
id_is_owner_w(2).
id_is_owner_w(3).
id_is_owner_w(4).
id_is_owner_w(5).
id_is_owner_w(6).
id_chanel(1,101).
id_chanel(2,102).
id_chanel(3,103).
id_chanel(4,104).
id_chanel(5,105).
id_chanel(6,106).

stack(Element,Filo,[Element|Filo]).
equals(Element,Element).

get_chanel(Title, R):-
  id_title(X,Title),
  id_chanel(X,R).

greater_than(N,R):-
  greater_thana(N,[1,2,3,4,5,6],R).

greater_thana(_N, [X|[]],[X|[]]).

greater_thana(N,[First|Rest],R):-
  greater_thana(N,Rest,R1),
  id_length(First,L),
  L > N,
  stack(First,R1,R);
  greater_thana(N,Rest,R1),
  equals(R1,R).

member(X,[X|_]).
member(X,[_First|Rest]):-
  member(X,Rest).

is_hd(T,K):-
  id_title(I,T),
  id_keyword(I,Kl),
  member(K,Kl).

get_titles([],[]).
get_titles([First|Rest],R):-
  get_titles(Rest,R1),
  id_title(First,T),
  stack(T,R1,R).
