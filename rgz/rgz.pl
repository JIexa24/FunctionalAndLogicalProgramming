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
      write('--------------------------------'),nl,
      write('Выберите нужный пункт меню: [1-6] (7 - выход) '),
      read(X),
      X<8,
      process(X),
      X=7,!.

process(1):-view_base.
process(2):-add_base.
process(3):-remove_base.
process(4):-load_base.
process(5):-save_base.
process(7):-retractall(student/3),!.

load_base:-
  consult('basesrc.dat'),!.

save_base:-
  tell('basedst.dat'),
  listing(airport),
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
  write('Name: '),
  read(Name),
  write('Group: '),
  read(Group),
  write('Marks: '),
  read(Marks),
  assertz(student(Group,Name,Marks)),
  again,!.

remove_base:-
  write('Удаление записи'),nl,nl,
  write('Введите Имя для удаления: '),
  read(Name),
  retract(student(_,Name,_)),
  write('Запись удалена!'),nl,nl.

again :-
  write('Ввести еще одно ? y/n '),
  read(A),
  answer(A).

answer(_):-fail.
answer(y):-fail.
answer(n).
