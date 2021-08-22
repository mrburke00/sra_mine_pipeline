###
# SRA mining pipeline
#
###
sra_examples=['SRR13528220','SRR12532404','SRR10024973']

rule all:
	expand('/mnt/local/var-calling/raw_data/{type}.sorted.bam', type = sra_examples)
	expand('/mnt/local/var-calling/raw_data/{type}.sorted.bam.bai', type = sra_examples)

rule download_sra:
	output:
		expand('/mnt/local/var-calling/raw_data/{type}_1.fastq', type = sra_examples),
		expand('/mnt/local/var-calling/raw_data/{type}_2.fastq', type = sra_examples)
	shell:
		"bash src/download_sra.sh"

rule generate_reference:
	output:
		'/mnt/loca/var-calling/reference_data/GCA_000002315.5_GRCg6a_genomic.fna'
		#reference file?
	shell:
		"bash src/generate_reference.sh"

rule generate_bam:
	input:
		expand('/mnt/local/var-calling/raw_data/{type}_1.fastq', type = sra_examples),
		expand('/mnt/local/var-calling/raw_data/{type}_2.fastq', type = sra_examples),
		'/mnt/loca/var-calling/reference_data/GCA_000002315.5_GRCg6a_genomic.fna'
	output:
		expand('/mnt/local/var-calling/raw_data/{type}.bam', type = sra_examples)
	shell:
		"bash src/generate_gam.sh"

rule sort_bam:
	input:
		expand('/mnt/local/var-calling/raw_data/{type}.bam', type = sra_examples)	
	output:
		expand('/mnt/local/var-calling/raw_data/{type}.sorted.bam', type = sra_examples)
	shell:
		"bash src/sort_bam.sh"

rule generate_bai:
	input:
		expand('/mnt/local/var-calling/raw_data/{type}.sorted.bam', type = sra_examples)
	output:
		expand('/mnt/local/var-calling/raw_data/{type}.sorted.bam.bai', type = sra_examples)
	shell:
		"bash src/generate_index.sh"


'''rule upload_s3:
	input:
		#read group bams
		#bai
		#reference
	output:
		#not sure
	shell:'''

