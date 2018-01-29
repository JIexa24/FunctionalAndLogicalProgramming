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
      write('2–Добавить новую запись в базу данных. '),nl,
      write('3–Удалить запись из базы данных. '),nl,
      write('4–Загрузить базу из файла. '),nl,
      write('5–Сохранить базу в файл. '),nl,
      write('6–Само РГЗ. '),nl,
      write('--------------------------------'),nl,
      write('Выберите нужный пункт меню: [1-6] (7 - выход): '),nl,
      read(X),
      X<8,
      process(X),
      X=7,!.

process(1):-view_base.
process(2):-add_base.
process(3):-remove_base.
process(4):-load_base.
process(5):-save_base.
process(6):-find_base.
process(7):-retractall(student/3),!.

get_mark(_/M, M).
get_name(student(Name, _), Name).

checkPos(student(_, L)) :-
      maplist(get_mark, L, Ms),
      include(>=(5), Ms, LMs),
      length(LMs, LenLMs),
      LenLMs < 3.

checkNeg(student(_, Q)) :-
      maplist(get_mark, Q, Ms),
      include(>=(2), Ms, LMs),
      length(LMs, LenLMs),
      LenLMs > 0.

member(H,[H|_]).
member(H,[_|T]):-member(H,T).
no_double([H|T],T1):-member(H,T),delete(T,H,T2),no_double(T2,T1).
no_double([H|T],[H|T1]):-not(member(H,T)),no_double(T,T1).
no_double([],[]).

find_base:-
  findall(student(Name, List), student(_, Name, List), Ss),
  include(checkPos, Ss, Ls),
  maplist(get_name, Ls, Ns),
  findall(student(Name, List), student(_, Name, List), Qs),
  include(checkNeg, Qs, Ws),
  maplist(get_name, Ws, Rs),
  intersection(Ns, Rs, I),
  append(Ns, I, Hs),
  no_double(Hs, X),
  member(L, X),
  student(Group,Name,Marks),
  Name = L,
  write('Positive!'),nl,
  write('Group: '), write(Group),nl,
  write('Name: '), write(Name),nl,
  write('Marks: '), write(Marks),nl,
  write('-------------------------------'),nl,
  fail.

load_base:-
  consult('basesrc.dat'),!.

save_base:-
  tell('basedst.dat'),
  listing(student),
  told,
  write('Текстовый файл базы данных(basedst.dat) сохранен!'),nl.

view_base:-
  student(Group,Name,Marks),
  write('Group: '), write(Group),nl,
  write('Name: '), write(Name),nl,
  write('Marks: '), write(Marks),nl,
  write('-------------------------------'),nl.

add_base:-
  write('Add to base:'),nl,nl,
  repeat,
  write('Name: '),nl,
  read(Name),
  write('Group: '),nl,
  read(Group),
  write('Marks: '),nl,
  read(Marks),nl,
  assertz(student(Group,Name,Marks)),
  again,!.

remove_base:-
  write('Удаление записи'),nl,nl,
  write('Введите Имя для удаления: '),nl,
  read(Name),
  retract(student(_,Name,_)),nl,
  write('Запись удалена!'),nl,nl.

again :-
  write('Ввести еще одно ? y/n '),
  read(A),
  answer(A).

answer(_):-fail.
answer(y):-fail.
answer(n).
