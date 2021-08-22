sudo chmod ugo+wx /mnt/local/var-calling/
sudo chmod ugo+wx /mnt/local/var-calling/raw_data

sra_examples=('SRR13528220','SRR12532404','SRR10024973')

cd /mnt/local/var-calling


for val1 in ${sra_examples[*]}; do
	#aws s3 cp s3://layerlabcu/test_chicken_sra/${val1}_1.fastq raw_data/${val1}_1.fastq 
	#aws s3 cp s3://layerlabcu/test_chicken_sra/${val1}_2.fastq raw_data/${val1}_2.fastq

	header=$(cat "raw_data/${val1}_1.fastq" | head -n 1)
	id=$(echo $header | head -n 1 | cut -f 1-4 -d":" | sed 's/@//' | sed 's/:/_/g')
	sm=$(echo $header | head -n 1 | grep -Eo "[ATGCN]+$")
	echo "Read Group @RG\tID:$id\tSM:$id"_"$sm\tLB:$id"_"$sm\tPL:ILLUMINA"


	bwa mem -M -t 36 -R "@RG\tID:$id\tSM:$id"_"$sm\tLB:$id"_"$sm\tPL:ILLUMINA" \
	reference_data/GCA \
	raw_data/${val1}_1.fastq raw_data/${val1}_2.fastq  \
	2> bwa.err \
	> results/bwa/${val1}.bam

	#aws s3 cp results/bwa/${val1}.bam s3://layerlabcu/test_chicken_sra/

	#rm -r raw_data/${val1}_1.fastq
	#rm -r raw_data/${val1}_2.fastq
	#rm -r results/bwa/${val1}_1.bam

done