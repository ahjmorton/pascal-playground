unit temperature;

interface

function celsius_to_farenheit(celsius: real):real;
function farenheit_to_celsius(farenheit: real):real;

implementation

function celsius_to_farenheit(celsius: real):real;
begin
   celsius_to_farenheit := celsius * 1.8 + 32;
end;

function farenheit_to_celsius(farenheit: real):real;
begin
   farenheit_to_celsius := (farenheit - 32) / 1.8;
end;

end.
