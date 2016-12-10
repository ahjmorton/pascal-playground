program tree;

var 
   requiredHeight : integer;
   height: integer;
   currentWidth: integer;
   width: integer;
   baseWidth: integer;
   baseMid: integer;
   left: integer;
begin
   write('How high do you want a tree? ');
   readln(requiredHeight);
   baseWidth := requiredHeight + (requiredHeight - 1);
   baseMid := baseWidth div 2;
   currentWidth := 1;
   for height:= 1 to requiredHeight do
   begin
      left := baseMid - (height - 2);
      write('*':left);
      for width := 2 to currentWidth do
      begin
         write('*');
      end;
      writeln();
      currentWidth := currentWidth + 2;
   end;
   writeln('\__/':baseMid + 2);
end.
