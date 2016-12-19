program bar_charts;

const 
   Max_Width:real = 75;

var
   numbers : array[0..1000] of real;
   max_point, increment : real;
   i, j, points, bar_size: integer;
   exit_code: integer;
   user_input: string;
   user_number: real;

begin 
   i := 0;
   max_point := 0;
   while true do
   begin
       readln(user_input);
       if user_input = '' 
       then break;

       Val(user_input, user_number, exit_code);
       numbers[i] := user_number;
       
       if user_number > max_point 
       then max_point := user_number;

       i := i + 1;
   end;

   points := i - 1;
   increment := Max_Width / max_point;
   
   writeln();
   for i := 0 to points do
   begin
      bar_size := trunc(numbers[i] * increment);
      for j := 0 to bar_size do 
      begin
         write('*');
      end;
      writeln(' ', numbers[i]:0:4);
   end;
end.
