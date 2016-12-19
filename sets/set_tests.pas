program set_test;

const 
    acceptable_values = [0..10];

var 
    user_input: integer;

begin
    write('Enter an input: ');
    readln(user_input);
    if user_input in acceptable_values 
    then writeln('Input is acceptable')
    else writeln('Input isn not acceptable');
end.
