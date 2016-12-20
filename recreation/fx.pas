unit fx;

interface

uses fx_model;

const 
    No_Rate_Found:real = -1;

function fx_convert(fx_rates: array of fx_rate; base: string; quote: string; amount: real; var rate: real):real;

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

function inverse(fx_rate: real):real;
begin
    inverse := 1 / fx_rate;
end;

function find_inverse_fx_rate(fx_rates: array of fx_rate; base: string; quote: string): real;
var 
   candidate: real;
begin 
   candidate := find_basic_fx_rate(fx_rates, quote, base);
   if candidate = No_Rate_Found
   then find_inverse_fx_rate := No_Rate_Found
   else find_inverse_fx_rate := inverse(candidate);
end;


function find_cross_rate(fx_rates : array of fx_rate; base: String; quote: string): real;
var 
   i: integer;
   base_rate: fx_rate;
   quote_rate: real;
function find_base_or_inverse(base: String; quote:String):real;
begin
   find_base_or_inverse := find_basic_fx_rate(fx_rates, base, quote);
   if find_base_or_inverse = No_Rate_Found
   then find_base_or_inverse := find_inverse_fx_rate(fx_rates, base, quote);
end;

begin
   find_cross_rate := No_Rate_Found;  
   for i := 0 to length(fx_rates) do
   begin
       base_rate := fx_rates[i];
       if base_rate.base = base then 
       begin
           quote_rate := find_base_or_inverse(base_rate.quote, quote);
           if quote_rate <> No_Rate_Found
           then Exit(base_rate.fx_rate * quote_rate);
       end
       else if base_rate.quote = base then
       begin
           quote_rate := find_base_or_inverse(base_rate.base, quote);
           if quote_rate <> No_Rate_Found
           then Exit(inverse(base_rate.fx_rate) * quote_rate);
       end;
   end;
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
   
   candidate := find_cross_rate(fx_rates, base, quote);
   if candidate <> No_Rate_Found
   then Exit(candidate);
end;

function fx_convert(fx_rates: array of fx_rate; base: string; quote: string; amount: real; var rate: real):real;
begin
   rate := find_fx_rate(fx_rates, base, quote);
   if rate = No_Rate_Found 
   then fx_convert := No_Rate_Found
   else fx_convert := amount * rate
end;
end.
