program temperature_conv;

uses temperature;

function read_in_temp(var suffix: char):real;
var 
   user_input, number_input: string;
   exit_code: integer;
begin
   readln(user_input);
   suffix := user_input[length(user_input)];
   number_input := copy(user_input, 1, length(user_input));
   repeat 
      Val(number_input, read_in_temp, exit_code);
      number_input := copy(user_input, 1, length(exit_code));
   until exit_code = 0;
end;

procedure main();
var 
  temp : real;
  suffix: char;
begin
   write('Please enter a temperature string: ');
   temp := read_in_temp(suffix);
   writeln('Read in ', temp:0:2, ' of ', suffix);
end;

begin
   main;
end.
