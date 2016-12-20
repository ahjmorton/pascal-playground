program fx_conv;

uses fx, fx_model, fx_storage;

const 
   Decimal_Places = 4;

function toUpper(aChar: char):char;
begin
   if aChar in ['a'..'z'] 
   then toUpper := chr(ord(aChar) - 32)
   else toUpper := aChar;
end;

procedure list_fx_rates();
var
   rates : array of fx_rate;
   rate : fx_rate;
   i: integer;
begin
   rates := get_rates();
   for i := 0 to Length(rates) - 1 do
   begin
       rate := rates[i];
       writeln('Base: ', rate.base, ' Quote: ', rate.quote, ' Rate: ', rate.fx_rate:0:Decimal_Places);
   end;
end;

procedure add_fx_rate();
var
   new_entry: fx_rate;
begin
   write('Base: ');
   readln(new_entry.base);
   write('Quote: ');
   readln(new_entry.quote);
   write('Rate: ');
   readln(new_entry.fx_rate);
   store_rate(new_entry);
end;

procedure convert();
var 
   base, quote: string;
   amount, rate, converted: real;
   rates : array of fx_rate;
begin
   rates := get_rates();
   write('Base: ');
   readln(base);
   write('Quote: ');
   readln(quote);
   write('Amount: ');
   readln(amount);
   
   converted := fx_convert(rates, base, quote, amount, rate);
  
   writeln(base, ' in ', quote, ' at ', rate:0:Decimal_Places, ' = ', converted:0:Decimal_Places);
end;

procedure main();
var 
   choice : char;
   running : boolean;
begin
   running := true;
   
   while running do
   begin
       writeln('Currency converter');
       writeln('==================');
       writeln('C) Convert');
       writeln('L) List FX rates');
       writeln('A) Add FX rate');
       writeln('Q) Quit');
       write('Please enter a choice: ');
       readln(choice);
       choice := toUpper(choice);
       case choice of
          'C' : convert();
          'L' : list_fx_rates(); 
          'A' : add_fx_rate();
          'Q' : running := false;
       else writeln('Unknown response ', choice);
       end;
   end;
end;

begin
   main;
end.
