# ANGSD pipeine for Population Branch Statistics calculation

### Abreviations
**PBS**: Population Branch Statistics
**100G-Mx**: One Hundred Mexican Genomes Project

## Function
Pipeline calculates genome-wide Fst for 3 populations, then compares Fst differences by window slide.
Regions with discrepacies between window slide and genome-wide Fst distances between the populations, are identified as candidate regions for selective pressure.

### PBS calculation is performed trough the following stages:

- 001a -> Random sample extraction from 1000 genoomes project data, for Population 1.

- 001b -> Random sample extraction from 1000 genoomes project data, for Population 2.

- 002a -> Site Allele Frequency (.saf) calculation for Population 1, using data from 001a/results.

- 002b -> Site Allele Frequency (.saf) calculation for Population 2, using data from 001b/results.

- 002c -> Site Allele Frequency (.saf) calculation for Population 3 (100G-Mx), usgin bam files.

- 003a -> Site Frequency Spectrum (.sfs) calculation for Population 3 vs Population 1, using data from 002c/results/ and 002a/results.

- 003b -> Site Frequency Spectrum (.sfs) calculation for Population 3 vs Population 2, using data from 002c/results/ and 002b/results.

- 003c -> Site Frequency Spectrum (.sfs) calculation for Population 1 vs Population 2, using data from 002a/results/ and 002b/results.

### Notes

- Paralelization is done by chromosomes.

# **TO DO**
- [ ] Solve installation problems of realSFS (from angsd bin folder), to continue with testing and development of 003x stages.
- [ ] Develop and testing of 004 stage (for window slide analysis of Fst distances).
- [ ] Develop and testing of 005 stage (for data anotation with ensembl VEP)
- [ ] Develop and testing of 006 stage (for data visualization)