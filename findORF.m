function [ORFlength, start_pos, stop_pos] = findORF(dnaseq)
%Function to find the length of the longest open reading frame of a
%sequences called dnaseq

    %turn everything into uppercase
    dnaseq = upper(dnaseq);
    
    %find start codons' positions
    start_ind = strfind(dnaseq, 'ATG');
    %find end codons' positions
    end_ind_unsorted = [strfind(dnaseq, 'TAA'), strfind(dnaseq, 'TGA'), strfind(dnaseq, 'TAG')];
    end_ind = sort(end_ind_unsorted);

    ORF = [];
    
    %for every start codon
    for ind = 1:length(start_ind)
        %only take frames that are multiple of 3
        logi_3 = mod((end_ind - start_ind(ind)),3) ~= 0;
        diff_array = end_ind - start_ind(ind);
        diff_array(logi_3) = NaN;
        
        viable = find(diff_array>0);
            if isempty(viable)
                ORF(ind) = 0;
                ORF_start(ind) = 0;
                ORF_end(ind) = 0;
            else
                ORF(ind) = diff_array(viable(1));
                ORF_start(ind) = start_ind(ind);
                ORF_end(ind) = end_ind(viable(1));
            end
    end
    %find longest ORF if there are ORFs starting from this start codon
    longest = max(ORF);
    if longest~=0
        idx = find(ORF == longest);
        start_pos = ORF_start(idx(1));
        stop_pos = ORF_end(idx(1));
        longest_ORF = dnaseq(start_pos:stop_pos+2);
        ORFlength = length(longest_ORF);
    else
        %when no ORF is found, ORF length would be 0, and start and stop
        %codon would be NaN.
        ORFlength = 0;
        start_pos = NaN;
        stop_pos = NaN;
    end
end
