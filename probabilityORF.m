function prob = probabilityORF(N, N_ORF)
    total = 0;
    %find longest ORF for 1000 times with a sequence length of N
    for n = 1:1000
        dnaseq = randdnaseq(N);
        [ORFlength,~,~] = findORF(dnaseq);
        %count the number of longest ORFs that >N_ORF
        if ORFlength >= N_ORF
            total = total + 1;
        end
    end
    prob = total / 1000;
end

