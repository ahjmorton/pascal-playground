program f2c;

uses temperature;

procedure main();
var 
  temp : real;
begin
   write('Please enter farenheit: ');
   readln(temp);
   writeln('Equal to ', farenheit_to_celsius(temp):0:2, 'C');
end;

begin
   main;
end.
