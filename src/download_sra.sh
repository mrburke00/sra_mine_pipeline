mkdir /mnt/local/sra
cd /mnt/local/sra
sra_examples=('SRR12827888' 'SRR2131205' 'SRR12827887')
for val1 in ${sra_examples[*]}; do
	prefetch $val1 --max-size 60g
	fasterq-dump $val1
	#aws s3 cp ${val1}_1.fastq s3://layerlabcu/test_chicken_sra/
	#aws s3 cp ${val1}_2.fastq s3://layerlabcu/test_chicken_sra/
	#rm -r ${val1}
	#rm -r ${val1}_1.fastq
	#rm -r ${val1}_2.fastq
done