p([],_,_,[]):-!.
p([Y|T],X,Y,[X,Y|T1]):-!,p(T,X,Y,T1).
p([H|T],X,Y,[H|T1]):-p(T,X,Y,T1).
