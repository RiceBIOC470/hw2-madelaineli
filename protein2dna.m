function dnaseq = protein2dna(proteinseq)
filename = 'codons.csv';
aa_codon_table = readtable(filename);
aa_codon_cell = table2array(aa_codon_table(:,1:2));
aa_codon_array = cell2mat(aa_codon_cell);
dnaseq = '';
for ii = 1:3:length(proteinseq)-2
    same_codon = '';
    for jj = 1:64
        if proteinseq(ii:ii+2) == aa_codon_array(jj,1:3)
            same_codon = strcat(same_codon, aa_codon_array(jj,4:6));
        end
    end
    same_num = length(same_codon)/3;
    rand_num = randi(same_num,1);
    dnaseq = strcat(dnaseq,same_codon(rand_num*3-2:rand_num*3));
end
stop_codon = 'TGATAGTAA';
rand_num_2 = randi(3,1);
stop_choice = stop_codon(rand_num_2*3-2:rand_num_2*3);
dnaseq = strcat(dnaseq,stop_choice);
end
