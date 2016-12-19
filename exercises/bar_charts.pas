program bar_charts;

const 
   Max_Width: real = 75;
   Max_Inputs = 100;

type
   input_numbers = array[0..Max_Inputs] of real;

function read_input_numbers(var points: integer): input_numbers;
var 
   i, exit_code: integer;
   user_input: string;
begin 
   i := 0;
   while true do
   begin 
     readln(user_input);
     if user_input = '' 
     then break;

     Val(user_input, read_input_numbers[i], exit_code);
     i := i + 1;

   end;
   points := i;
end;  

function max_value(numbers: input_numbers; points: integer):real;
var 
   i : integer;
begin
   max_value := 0;
   for i := 0 to points - 1 do
   begin
       if numbers[i] > max_value 
       then max_value := numbers[i];
   end;
end;

procedure print_bar_chart(numbers: input_numbers; points: integer);
var 
    max_point, increment: real;
    i, bar_size, j: integer;
begin
    max_point := max_value(numbers, points);
    increment := Max_Width / max_point;
    for i := 0 to points - 1 do
    begin
        bar_size := trunc(numbers[i] * increment);
        for j := 0 to bar_size do
        begin
            write('*');
        end;
        writeln(numbers[i]:0:2);
    end;
end;
 
procedure main();
var 
   numbers : input_numbers;
   points : integer;
begin 
   numbers := read_input_numbers(points);
   writeln('');
   print_bar_chart(numbers, points);
end;

begin 
  main;
end.
