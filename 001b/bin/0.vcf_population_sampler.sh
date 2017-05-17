#°/bin/bash

sample_table=tmp/$1"_sample_table"
vcf_samples=tmp/vcf_samples
valid_samples=tmp/valid_samples.list

grep -w $1 data/igsr_samples.tsv > $sample_table
zgrep -w -m1 "#CHROM" $head_vcf | cut -f10- | tr "\t" "\n" | awk 'BEGIN {OFS="\t"} {print $0, NR+9} ' - > $vcf_samples

awk 'BEGIN { OFS="\t"; FS="\t" } FNR==NR{a[$1]=$2;next}{print $0,a[$1]?a[$1]:"Invalid"}' $vcf_samples $sample_table | grep -v -w "Invalid" > $valid_samples

Rscript --vanilla bin/1a.Randomizer.R $nPOP

echo "1-9" | cat - tmp/$1"_samples.rdm" | tr "\n" "," | sed s/",$"// > tmp/$1"_sample.list.build"
