program indicies;

var
   indexWeirdness: array[9..10] of integer; 
   i: integer;
begin
   indexWeirdness[9] := 124;
   for i := 0 to 20 do
   begin
      writeln(i, ')', indexWeirdness[i]);
   end;
end.
