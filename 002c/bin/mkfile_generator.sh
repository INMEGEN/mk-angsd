#!/bin/bash

###Chromosomes to evaluate in AMI samples
#CHROMOSOMES=($(seq 22) X Y MT)
CHROMOSOMES=( 22 )      ##For testing purposes

##Counting the number of samples to analize
n_AMI_samples=$(ls data/*.bam | wc -l)


##Create body of mkfile
##Create an array with the prereqs
prereq_list="tmp/prereq.list"
> $prereq_list.newlines

for i in data/*.bam
do
        echo "tmp/chr%.$(basename $i):Q:" >> $prereq_list.newlines
done

cat $prereq_list.newlines | tr "\n" " " | sed s/:Q://g > $prereq_list.oneline

#################################################
##Create main target job in mkfile
echo "< ../config.mk

all:VQ:
        bin/targets | xargs mk

results/$n_AMI_samples\$POP3\".chr%.saf.gz\":Q: $(cat $prereq_list.oneline)
	chrom=\$(echo \$target | cut -d\".\" -f2 | sed s#chr##)
	ori_file=\$(echo \$target | sed 's/.saf.gz//g')
        echo \"Calculating SAF for chromosome \$chrom to \$target\"
	ls tmp/chr\$chrom*.bam > tmp/chr\$chrom.bamlist
	angsd -b tmp/chr\$chrom.bamlist -anc \$ANCESTRAL -out \$ori_file.build -dosaf 1 -gl 1 &&
        for i in \$ori_file.build*
        do
                angsd_file=\$(echo \$i | sed 's/.build//g')
                mv \$i \$angsd_file
        done &&
	rm tmp/*
" > mkfile

## Create jobs for slicing chromosomes
while read p
do
prereq=$(echo $p | sed s#tmp/chr%.#data/#g | sed s#:Q:##g )
	echo "$p $prereq
	chrom=\$(echo \$target | cut -d\".\" -f1 | sed s#tmp/chr##)
	echo \"Slicing \$chrom from \$prereq\"
	samtools_0.1.18 view -h -b \$prereq \$chrom > \$target.build &&
	mv \$target.build \$target
	samtools_0.1.18 index \$target
	" >> mkfile
done < $prereq_list.newlines

