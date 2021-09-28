program game;
type
    boxarray = record
    a: array[1..6] of integer;
    end;
var
    b: boxarray;
    turn: string;
    num: integer;
procedure init(var b: boxarray);
var
    i: integer;
begin
    i:= 1;
    repeat
        b.a[i]:= 2;
        i:= i + 1;
    until i > 6;
end;
procedure rules(var b: boxarray; num: integer);
begin
    if num = 1 then
        begin
            b.a[num]:= b.a[num] + 2;
            b.a[num + 1]:= b.a[num + 1] - 1;
            b.a[6]:= b.a[6] - 1;
        end
    else if num = 6 then
        begin
            b.a[num]:= b.a[num] + 2;
            b.a[num-1]:= b.a[num - 1] - 1;
            b.a[1]:= b.a[1] - 1;
        end
    else
        begin
            b.a[num]:= b.a[num] + 2;
            b.a[num - 1]:= b.a[num - 1] - 1;
            b.a[num + 1]:= b.a[num + 1] - 1;
        end;
end;
procedure displaybox (b: boxarray);
var
   i: integer;
begin
    i:= 1;
    write('Box # :');
    repeat
        writeln(' ', i);
        i:= i + 1;
    until i > 6;
    i:= 1;
    write('Value :');
    repeat
        writeln(' ', b.a[i]);
        i:= i + 1;
    until i > 6;
end;
function endgame (b: boxarray): Boolean;
var
   i: integer;
begin
    i:= 1;
    endgame:= false;
    repeat
        if b.a[i] < 0 then
            endgame:= true;
        i:= i + 1;
    until i > 6;
end;
begin
    init(b);
    repeat
        writeln('Press <Enter> to roll the dice');
        readln();
        randomize;
        num:= random(6) + 1;
        writeln('Player rolls a ', num, '.');
        rules(b, num);
        displaybox(b);
        endgame(b);
        if endgame(b) = true then
            writeln('Computer wins.');
        randomize;
        num:= random(6) + 1;
        writeln('Computer rolls a ', num, '.');
        rules(b, num);
        displaybox(b);
        endgame(b);
        if endgame(b) = true then
            writeln('Player wins.');
    until endgame(b) = true;
    readln();
end.