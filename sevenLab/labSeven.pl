
read_in_list(_, []):- at_end_of_stream, !.
read_in_list(F, [H|T]):- read_line_to_codes(F, C), string_codes(H, C), read_in_list(F, T).

write_list(_, []):- !.
write_list(F, [H|T]):- writeln(H), write_list(F, T).

task:- read(Sub),
open('in.txt', read, F),
set_input(F), read_in_list(F, L),
close(F),
findall(X, (member(X, L),
sub_string(X, _, _, _, Sub)), OUT),
open('out.txt', write, W),
set_output(W),
write_list(W, OUT),
close(W).
