del([],_,[]).
del([A,X|Tail],X,[X|NewTail]):-A \== X,!,del(Tail,X,NewTail).
del([H|Tail],X,[H|NewTail]):-del(Tail,X,NewTail).
