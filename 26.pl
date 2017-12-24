split([],[],[]).
split([H|T],[H|P],N) :- H>=0, split(T,P,N).
split([H|T],P,[H|N]) :- H<0, split(T,P,N).

app([],X,X).
app([H|T],X,[H|Y]) :- app(T,X,Y).

coll(L,R) :- split(L,P,N), app(P,N,R).
