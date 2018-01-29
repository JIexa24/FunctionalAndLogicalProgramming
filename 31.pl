split([],[],[]).
split([H|T],[H|P],Z) :- H\==0, split(T,P,Z).
split([H|T],P,[H|Z]) :- H=:=0, split(T,P,Z).

app([],X,X).
app([H|T],X,[H|Y]) :- app(T,X,Y).

coll(L,R) :- split(L,P,Z), app(P,Z,R),!.
