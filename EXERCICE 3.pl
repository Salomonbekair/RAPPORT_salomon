/* prédicat renverse/2*/
inverser(L1,L2) :- inverser(L1,[],L2).
inverser([], L1, L1).
inverser([X|Y], L1, L2) :- inverser(Y, [X|L1], L2).

/*  prédicat sousens/2*/
sous-ensemble([],_).
sous-ensemble([X|L2],L1) :- element(X,L1),sous-ensemble(L2,L1).

/*  prédicat sommecarres/2, prédicat average/2,*/
avg( List, Avg ):- sumlist( List, Sum ), length( List, Length), Length > 0, Avg is Sum / Length.

average(X,Y):- sumlist(X,Sum), ( Sum=0 -> true,writeln('Sum = 0') ; avg(X,Y)).

/* prédicat maxlist/2*/
maxlist(L, N) :- max_member(X,L), N>=X.
element(T,L,P) :- T >= 0 , 
nth0(T, L, E),
P is E, 
M = T-2, 
element(M,L,P).

/* prédicat moinsder/2*/
moinsder(L1,L2):- reverse(L1,X), nth0(0,X,Elem), deleted(Elem,X,Z), reverse(Z,Y), maplist(=,Y,L2).

deleted(Y,[Y|Tail],Tail).

/*  prédicat pairs/2 */
pairs([], []).
pairs([T|Q], [T|L2]):- T mod 2 =:= 0, listepairs(Q, L2).
pairs([T|Q], L2):- T mod 2 =:= 1, listepairs(Q, L2).
     