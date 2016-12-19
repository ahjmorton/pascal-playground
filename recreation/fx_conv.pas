program fx_conv;

uses fx;

procedure main();
var 
   test_rate : array[0..0] of fx_rate;
   to_convert : real;
begin
   test_rate[0].base := 'USD';
   test_rate[0].quote := 'EUR';
   test_rate[0].fx_rate := 0.96;
   
   writeln('Please enter rate to convert :');
   readln(to_convert);
   
   writeln('USD to EUR :', fx_convert(test_rate, 'USD', 'EUR', to_convert):0:2);
   writeln('EUR to USD :', fx_convert(test_rate, 'EUR', 'USD', to_convert):0:2);
end;

begin
   main;
end.
