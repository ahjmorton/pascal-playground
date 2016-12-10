program first;

const 
  Name = 'Andrew Morton';
  NameLength = length(Name);
  Street = '432 Govnerment aff';
  StreetLength = length(Street);
  City = 'Walthcross';
  CityLength = length(City);
var 
  start: integer;

begin
   start := 0;
   writeln(Name:start + NameLength);
   start := start + NameLength;
   writeln(Street: start + StreetLength);
   start := start + StreetLength;
   writeln(City: start + CityLength);
end.
