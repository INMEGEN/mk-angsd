#Same castillo PATH
PATH=/castle/cfresno/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/usr/lib/plan9/bin:/usr/bin/

#Directorio del genoma de referencia usado en 100G-MX
REF="/100g/references/human-reference/v37_decoy/human_g1k_v37_decoy.fasta"

###
##Parametros ANGSD

#VCF for header extraction
head_vcf="data/1000G/vcfs/ALL.chr22.phase3_bc_union.20130502.biallelic_svm_snps_indelsAF0.005_svs.gl.vcf.gz"

#Populations for PBS analisys
POP1="EAS"
POP2="FR"
POP3="AMI"

#Number of individuals for each POP
nPOP="2"

#ancestral alleles for angsd
ANCESTRAL="/castle/fperez/Seleccion_positiva/Input_files/Ancestral_sequence/chimpHg19.fa.gz"

#reference genome used in 1000Genomes
OTG_REFfai="/castle/fperez/Seleccion_positiva/Input_files/VCFs/1000G_p3/hs37d5.fa.gz.fai"

##Parameters for 2dSFS
#Nuber of threads used for 2dSFS calculation

nth_2dSFS="4"
