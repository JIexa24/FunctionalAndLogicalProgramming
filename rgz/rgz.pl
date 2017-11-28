insert(Element, [], [Element]):-!.
insert(Element, [Head|Tail], [Element, Head|Tail]):-
  Element < Head, !.
insert(Element, [Head|Tail], [Head|InsertTail]):-
  insert(Element, Tail, InsertTail).
