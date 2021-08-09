sudo chmod ugo+wx /mnt/local/var-calling/
sudo chmod ugo+wx /mnt/local/var-calling/raw_data

sra_examples=('SRR12532405')

for val1 in ${sra_examples[*]}; do
	aws s3 cp s3://layerlabcu/test_chicken_sra/${val1}_1.fastq raw_data/${val1}_1.fastq 
	aws s3 cp s3://layerlabcu/test_chicken_sra/${val1}_2.fastq raw_data/${val1}_2.fastq

	bwa mem -M -t 36 \
	reference_data/GCA \
	raw_data/${val1}_1.fastq raw_data/${val1}_2.fastq  \
	2> bwa.err \
	> results/bwa/${val1}.bam

	aws s3 cp results/bwa/${val1}.bam s3://layerlabcu/test_chicken_sra/

	rm -r raw_data/${val1}_1.fastq
	rm -r raw_data/${val1}_2.fastq
	rm -r results/bwa/${val1}_1.bam

done