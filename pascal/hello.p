function Max ( var A: Vetor ): integer;
var i, Temp: integer;
begin
    Temp := A[1];
    for  i :=2 to n do
        if Temp  < A[i]  then Temp := A[i];
    Max := Temp
end
