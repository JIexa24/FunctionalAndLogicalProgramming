p([],_,_,[]).
p([X|T],X,Y,[Y|T1]):-!,p(T,X,Y,T1).
p([H|T],X,Y,[H|T1]):-p(T,X,Y,T1).
