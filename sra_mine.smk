###
# SRA mining pipeline
#
###


rule all:
	#BAMS AND BAI files

rule download_sra:
	output:
		expand('/mnt/local/var-calling/raw_data/{type}_1.fastq', type = ['SRR12827888','SRR2131205','SRR12827887']),
		expand('/mnt/local/var-calling/raw_data/{type}_2.fastq', type = ['SRR12827888','SRR2131205','SRR12827887'])
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
		expand('/mnt/local/var-calling/raw_data/{type}_1.fastq', type = ['SRR12827888','SRR2131205','SRR12827887']),
		expand('/mnt/local/var-calling/raw_data/{type}_2.fastq', type = ['SRR12827888','SRR2131205','SRR12827887']),
		'/mnt/loca/var-calling/reference_data/GCA_000002315.5_GRCg6a_genomic.fna'
	output:
		expand('/mnt/local/var-calling/raw_data/{type}.bam', type = ['SRR12827888','SRR2131205','SRR12827887'])
	shell:
		"bash src/generate_gam.sh"

## sort bam
	#input:
		# bams

## generate read groups bam
	#input:
		# sorted bams

rule generate_bai:
	input:
		#read group bams
	output:
		expand('/mnt/local/var-calling/raw_data/{type}.bai', type = ['SRR12827888','SRR2131205','SRR12827887'])
	shell:
		"bash src/generate_index.sh"


rule upload_s3:
	input:
		#read group bams
		#bai
		#reference
	output:
		#not sure
	shell:

