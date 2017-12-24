insert(Element, [], [Element]):-!.
insert(Element, [Head|Tail], [Element, Head|Tail]):-
  Element < Head, !.
insert(Element, [Head|Tail], [Head|InsertTail]):-
  insert(Element, Tail, InsertTail).

run:-
  retractall(student/3),
  consult('basesrc.dat'),
  menu.

menu:-
      repeat,
      write('-----------------------'),nl,nl,
      write('БАЗА ДАННЫХ: Итоги сессии студентов'),nl,nl,
      write('1–Просмотреть базу данных.'),nl,
      write('2–Добавить новые итоги сессии в базу данных. '),nl,
      write('--------------------------------'),nl,
      write('Выберите нужный пункт меню: [1-6] '),
      read(X),
      X<7,
      process(X),
      X=6,!.

process(1):-view_base.
process(2):-add_base.

process(6):-retractall(student/3),!.

view_base:-
  student(Group,Name,Marks),
  write('Group: '), write(Group),nl,
  write('Name: '), write(Name),nl,
  write('Marks: '), write(Marks),nl,
  write('-------------------------------'),nl.

add_base:-
  write('Add to base:'),nl,nl,
  repeat,
  write('Name: '),
  read(Name),
  write('Group: '),
  read(Group),
  write('Marks: '),
  read(Marks),
  assertz(student(Group,Name,Marks)),
  again,!.



again :-
  write('Ввести еще одно ? y/n '),
  read(A),
  answer(A).

answer(_):-fail.
answer(y):-fail.
answer(n).
