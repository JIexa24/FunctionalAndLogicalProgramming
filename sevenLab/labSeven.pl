run:- write('Введите строку...'), nl, read(S), nl,
     write('‚Введенная строка... '), write(S), nl,
     string_search('ING',S,O), new(S).

run:- write('‚ Нет окончаний ING').

new(S):- string_search('ING',S,O2), substring(S,0,O2,S1), concat(S1,'ED',S2),
                           string_length(S,L), N is L-O2-3, O1 is O2+3,
                           substring(S,O1,N,S3), concat(S2,S3,S4), new(S4).

new(S):- write('Итоговая строка... '), write(S).
