program guess;

const
   Max = 100;

var
   answer: integer;
   userGuess: integer;

begin
   answer := random(Max + 1);
   repeat 
      write('Guess between 1 and ', Max, ': ');
      readln(userGuess);
      if userGuess > answer 
      then writeln('Too high')
      else if userGuess < answer 
      then writeln('Too low')
      else writeln('Congrats');
   until answer = userGuess;
end.
