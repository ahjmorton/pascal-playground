program reading;

var
    height: integer;
    name: array[0..10] of char; 

begin
    write('Please enter a height: ');
    readln(height);
    writeln('You are ', height, '!');
    write('Please enter your name: ');
    readln(name);
    writeln('Your name is ', name, '!');
end.
