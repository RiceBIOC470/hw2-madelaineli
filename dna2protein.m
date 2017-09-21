function proteinseq = dna2protein(dnaseq,frame)
% Input a dna sequence and a reading frame and returns the corresponding
% protein sequence. 
if frame ~= 1:3
    proteinseq = 'error: frame has to be 1, 2 or 3';
else
    dna_length = length(dnaseq);
    dnaseq = dnaseq(frame:dna_length);
    [ORF_length, start_pos, end_pos] = findORF(dnaseq);
    if ORF_length == 0
        disp ('no ORF found in DNA sequence');
    else
        ORF = dnaseq(start_pos:end_pos+2);
    end

    filename = 'codons.csv';
    aa_codon_table = readtable(filename);
    aa_codon_cell = table2array(aa_codon_table(:,1:2));
    aa_codon_array = cell2mat(aa_codon_cell);
    aa = ' ';
    for ii = 1:3:ORF_length
        for jj = 1:64
            codon = strcat(ORF(ii),ORF(ii+1),ORF(ii+2));
            if codon == aa_codon_array(jj,4:6)
                aa = strcat(aa,aa_codon_array(jj,1:3));
            end
        end
    end
    %remove "end" at the end of protein sequence
    proteinseq = aa(1:ORF_length-3);
end

