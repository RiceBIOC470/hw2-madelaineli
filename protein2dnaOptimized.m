function dnaseq = protein2dnaOptimized(proteinseq)
filename = 'codons.csv';
aa_codon_table = readtable(filename);
aa_codon_cell = table2array(aa_codon_table(:,1:2));
aa_codon_array = cell2mat(aa_codon_cell);
freq_array = table2array(aa_codon_table(:,3));

dnaseq = '';
for ii = 1:3:length(proteinseq)-2
    same_codon = '';
    freq = [];
    for jj = 1:64
        if proteinseq(ii:ii+2) == aa_codon_array(jj,1:3)
            same_codon = strcat(same_codon, aa_codon_array(jj,4:6));
            freq = [freq,freq_array(jj)];
        end
    end
    max_freq = max(freq);
    freq_logical = freq == max_freq;
    position = find (freq_logical == 1);
    codon = same_codon(position*3-2:position*3);
    dnaseq = strcat(dnaseq,codon);
end
stop_codon = 'TGA';
dnaseq = strcat(dnaseq,stop_codon);
end
