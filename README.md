# sra_mine_pipeline
This simple pipeline enables the scraping of SRA accension numbers for organism specific selelection of high quality samples. 

First navigate to https://www.ncbi.nlm.nih.gov/sra and apply desired filters as exemplified below. 

SRA Params:
- DNA
- Genome
- Paired
- Illumina
- BAM/CRAM/FASTQ
- organism selection

With filters enabled select `Send to:` in the top right region of the web page. Then `File > Format > RunInfo > Create File`. This will download a file called `SRARunInfo.csv`, move this to the `sra_mine_pipeline/ncbi_src/` directory. 

There are two possible scripts to run. 
`python multiOrganism_scrape.py` to create itemized file for number of samples per organism and respective instrument (not required).  This will convert scientific organisms to their common names for further data analysis. 

`python genereate_sra.py $scientific_organism_name` to generate SRA call numbers to be ouput to `$scientific_organism_name_sraRuns.txt`. 

A few notes on the `generate_sra.py` script:
- A hardcoded threshhold of 100000000 bases exists to filter out very low count samples. This is not currently a command line argument and must be changed manually. 
- Organism name is sensitive and much match the form denoted by NCBI. Try different iterations of the name if no results are produced. 
