task([_,_],0).
task([X,Y,Z|T],N) :- task([Y,Z|T],N1), X=:=Y, Y=:=Z, N is N1 + 1,!.
task([_,Y,Z|T],N) :- task([Y,Z|T],N).
