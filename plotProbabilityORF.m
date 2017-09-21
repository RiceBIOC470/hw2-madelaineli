function plotProbabilityORF(N_ORF)
% to find the optimal sequence length to test out the probability, we find
% sequence length that gives a probability of having an ORF greater than
% or equal to N_ORF to be greater than 0.95/0.90/0.85(depending on how long
% the sequence is), which would give us a graph
% that shows the behavior of the curve from probability = 0 to probability
% > 0.95/0.90/0.85.
prob = [];

if N_ORF>=100 && N_ORF < 200
    %find sequence length that gives probabilty > 0.90
    sl = N_ORF*10;
    while probabilityORF(sl, N_ORF)<0.90
        sl = sl + N_ORF*5;
    end
    % if N_ORF >= 100, we only calculate probability for every 5 sequence
    % length for efficiency.
    for N = 1:5:sl
        prob(floor(N/5)+1) = probabilityORF(N,N_ORF);
    end
    xval = 1:5:sl;
    
elseif N_ORF>=200&& N_ORF < 300
    %find sequence length that gives probabilty > 0.85
    sl = N_ORF*50;
    while probabilityORF(sl,N_ORF)<0.85
        sl = sl + N_ORF*20;
    end
    % if N_ORF >= 200 and <300, we only calculate probability for every 
    % 20 sequence length for efficiency.
    for N = 1:20:sl
        prob(floor(N/20)+1) = probabilityORF(N,N_ORF);
    end
    xval = 1:20:sl;
elseif N_ORF>=300
    %find sequence length that gives probabilty > 0.85
    sl = N_ORF*80;
    while probabilityORF(sl,N_ORF)<0.85
        sl = sl + N_ORF*30;
    end
    % if N_ORF >= 300, we only calculate probability for every 
    % 500 sequence length for efficiency.
    for N = 1:500:sl
        prob(floor(N/500)+1) = probabilityORF(N,N_ORF);
    end
    xval = 1:500:sl;
else
    %find sequence length that gives probabilty > 0.95
    sl = N_ORF*10;
    while probabilityORF(sl,N_ORF)<0.95
        sl = sl + N_ORF;
    end
    %calculate probability for every sequence length
    for N = 1:sl
        prob(N) = probabilityORF(N,N_ORF);
    end
    xval = 1:sl;
end

plot (xval, prob);
title (strcat('probability of having ORF of at least ',num2str(N_ORF),'bp vs. sequence length'));
xlabel ('sequence length')
ylabel (strcat('probability of >',num2str(N_ORF),'b.p.'))
end

