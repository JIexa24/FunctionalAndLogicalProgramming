repeated([], BufferResult, BufferResult):-!.
repeated([Head|Tail], BufferResult, Result):-
  member(Head, Tail),
  member(Head, BufferResult), !,
  repeated(Tail, [Head|BufferResult], Result).
repeated([_Head|Tail], BufferResult, Result):-
  repeated(Tail, BufferResult, Result).



count([],0):-!.
count([_|L],N):-
  count(L,N1),
  N is N1 + 1.

run(X,Y):-
  repeated(X, F, R),
  count(F,Y).
