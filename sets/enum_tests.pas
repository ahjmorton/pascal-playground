program enum_test;

type 
    weekday = (mon, tues, wed, thrus, fri, sat, sun);

var 
    day_input: weekday;
    next_date: weekday;
begin

    write('Please specify a day :');
    readln(day_input);
    writeln('Day you put in ', day_input);
    next_date := succ(day_input);
    writeln('The next day is ', next_date);;
end.
