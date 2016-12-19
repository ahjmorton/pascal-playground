program c2f;

uses temperature;

procedure main();
var 
  temp : real;
begin
   write('Please enter celsius: ');
   readln(temp);
   writeln('Equal to ', celsius_to_farenheit(temp):0:2, 'F');
end;

begin
   main;
end.
