program looping;

var 
   i : integer;
   powerOfTwo : integer;
   next: real;

begin
   write('Count powers of two to: ');
   readln(powerOfTwo);
   next := 1;
   for i := 1 to powerOfTwo do
   begin
       writeln(next);
       writeln(next:0:0);
       next := next * 2.0;
   end;
end.
