###
# SRA mining pipeline
#
###


rule all:
	#BAMS AND BAI files

rule download_sra:
	output:
		expand('/mnt/local/sra/{type}_1.fastq', type = ['SRR12827888','SRR2131205','SRR12827887']),
		expand('/mnt/local/sra/{type}_2.fastq', type = ['SRR12827888','SRR2131205','SRR12827887'])

	shell:
		"bash src/download_sra.sh"

rule generate_reference:
	output:
		#reference file?
	shell:

rule generate_bwa:
	input:
		#raw_data directory
	output:
		#bams
	shell:



