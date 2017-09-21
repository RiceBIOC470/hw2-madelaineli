function randomSeq = randdnaseq(N)
% returns a random dna sequence of length N
randnum = randi(4,[1,N]);
for x = 1:N
    if randnum(x) == 1
        randomSeq(x) = 'A';
    elseif randnum(x) == 2
        randomSeq(x) = 'G';
    elseif randnum(x) == 3
        randomSeq(x) = 'C';
    elseif randnum(x) == 4
        randomSeq(x) = 'T';
    end
end
end
