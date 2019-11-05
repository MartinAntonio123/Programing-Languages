%%% This code has been tested with SWI-Prolog (Multi-threaded, Version 5.2.13)
%%% and appears to function as intended.
mov(a,b).
mov(a,c).
mov(b,d).
mov(b,e).
mov(c,f).
mov(c,g).
mov(d,h).
mov(e,i).
mov(e,j).

go(Start, Goal) :-
   empty_stack(Empty_been_list),
   stack(Start, Empty_been_list, Been_list),
   path(Start, Goal, Been_list).

% path implements a depth first search in PROLOG

% Current state = goal, print out been list
path(Goal, Goal, Been_list) :-
    reverse_print_stack(Been_list).

path(State, Goal, Been_list) :-
    mov(State, Next),
    % not(unsafe(Next)),
    not(member_stack(Next, Been_list)),
    stack(Next, Been_list, New_been_list),
    path(Next, Goal, New_been_list), !.

reverse_print_stack(S) :-
    empty_stack(S).
reverse_print_stack(S) :-
    stack(E, Rest, S),
    reverse_print_stack(Rest),
    write(E), nl.
