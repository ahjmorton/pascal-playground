program painter;

const 
   CanCoverage = 5;
   
var
   roomHeight: integer;
   roomWidth: integer;
   roomLength: integer;
   frontWall: integer;
   sideWall: integer;
   footage: integer;
   cansRequired: integer;
begin
   write('Please enter room height: ');
   readln(roomHeight);
  
   write('Please enter room width: ');
   readln(roomWidth);

   write('Please enter room length: ');
   readln(roomLength);

   frontWall := roomHeight * roomWidth;
   sideWall := roomHeight * roomLength;
   footage := (frontWall * 2) + (sideWall * 2);
   cansRequired := footage DIV CanCoverage;

   writeln('You will need ', cansRequired, ' to cover a room of ', footage, 'm2');
end.
