function x=matrixDivision(y, A)
if (rank(A)==size(A,1))
    x=A\y;
else
    x=[];
    fprintf("Rank of A does not equal to size of A; A does not have a unique solution")
end
end