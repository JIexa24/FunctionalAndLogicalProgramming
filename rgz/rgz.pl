insert(Element, [], [Element]):-!.
insert(Element, [Head|Tail], [Element, Head|Tail]):-
  Element < Head, !.
insert(Element, [Head|Tail], [Head|InsertTail]):-
  insert(Element, Tail, InsertTail).



#student(521, Agishev, [flp/5, filos/5, pct/5, schem/4]).
#student(521, Belyaev, [flp/4, filos/3, pct/4, schem/3]).
#student(521, Lysenko, [flp/4, filos/3, pct/4, schem/4]).
#student(521, Manichev, [flp/2, filos/2, pct/4, schem/2]).
#student(521, Mingazeev, [flp/5, filos/4, pct/4, schem/5]).
