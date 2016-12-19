unit fx;

interface

const 
    No_Rate_Found:real = -1;

type
    fx_rate = record
       base: string;
       quote: string;
       fx_rate: real;
    end;

function fx_convert(fx_rates: array of fx_rate; base: string; quote: string; amount: real):real;

implementation

function find_basic_fx_rate(fx_rates: array of fx_rate; base: string; quote: string): real;
var 
   i:integer;
   fx_rate_entry: fx_rate;
begin
   find_basic_fx_rate := No_Rate_Found;
   for i := 0 to Length(fx_rates) do
   begin
     fx_rate_entry := fx_rates[i];
     if (fx_rate_entry.base = base) and (fx_rate_entry.quote = quote)
     then
     begin
         find_basic_fx_rate := fx_rate_entry.fx_rate;
         break;
     end;
   end;
end;

function find_inverse_fx_rate(fx_rates: array of fx_rate; base: string; quote: string): real;
var 
   candidate: real;
begin 
   candidate := find_basic_fx_rate(fx_rates, quote, base);
   if candidate = No_Rate_Found
   then find_inverse_fx_rate := No_Rate_Found
   else find_inverse_fx_rate := 1 / candidate;
end;

function find_fx_rate(fx_rates: array of fx_rate; base: string; quote: string):real;
var
   candidate: real;
begin
   find_fx_rate := No_Rate_Found;
   candidate := find_basic_fx_rate(fx_rates, base, quote);
   if candidate <> No_Rate_Found
   then Exit(candidate);
   
   candidate := find_inverse_fx_rate(fx_rates, base, quote);
   if candidate <> No_Rate_Found
   then Exit(candidate);
end;

function fx_convert(fx_rates: array of fx_rate; base: string; quote: string; amount: real):real;
var 
   fx_rate_to_use: real;
begin
   fx_rate_to_use := find_fx_rate(fx_rates, base, quote);
   if fx_rate_to_use = No_Rate_Found 
   then fx_convert := No_Rate_Found
   else fx_convert := amount * fx_rate_to_use
end;
end.
