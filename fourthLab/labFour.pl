%consult('filename')

parent(X, Y):-
    X = mary,Y = bob;
    X = mary,Y = ann;
    X = bob,Y = liz;
    X = bob,Y = paul;
    X = bob,Y = sam;
    X = paul,Y = pat;
    X = john,Y = bob.

man(john).
man(bob).
man(sam).
man(paul).
man(pat).
woman(mary).
woman(liz).
woman(ann).

diff(X,Y):- X\==Y.
diff(X,Y,Z):- X\==Y, Y\==Z, X\==Z.
father(X,Y):-parent(X,Y),man(X).
mother(X,Y):-parent(X,Y),woman(X).
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y), diff(X,Y).
sister(X,Y):-parent(Z,X),parent(Z,Y), woman(X), diff(X,Y).
grandchild(X, Y):-parent(Y,Z),parent(Z,X).
aunt(X,Y):-parent(Z,Y),sister(X, Z).
has_2_children(X):-
    setof(Y,parent(X, Y), L),
    length(L, 2).
successor(X):-parent(X,Y),man(Y),man(X).

%father(Who, sam).
%mother(Who, bob).
%sister(Who, sam).
%sister(Who, liz).su
%brother(Who, bob).
%grandchild(Who, mary).
%grandchild(paul, Who).
%aunt(Who, sam).
%grandchild(Who, mother(Who, ann)).
%has_2_children(Who).
%successor(bob).
