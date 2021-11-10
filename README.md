# sra_mine_pipeline
SRA Params:
- DNA
- Genome
- Paired
- Illumina
- BAM/CRAM/FASTQ
- organism selection

Sent to File > RunInfo > Move to sra_mine_pipeline directory 
`python runinfo_scrape.py` to create itemized file for number of samples per organism and respective instrument (not required)
`python genereate_sra.py` to generate SRA call numbers 
TODO:
- add organism, bases, and run count as CL arguments
- Output SRA runs to txt file

Copy SRA runs to sra_mine.smk 
TODO:
- read SRA runs from txt file

Run `config.sh`
cd /mnt/local
Run below 
```
export AWS_ACCESS_KEY_ID=X
export AWS_SECRET_ACCESS_KEY=X
export AWS_DEFAULT_REGION=X

export PATH=$PATH:$PWD/sratoolkit.2.11.1-ubuntu64/bin 
```
Run `vdb-config -i` 
```
Main > Enable Remote Access 
Cache > Disable local File-caching
AWS > report cloud instance identity 
Save
Exit
```
Todo:
- write settings to execute
Tmux Attach
