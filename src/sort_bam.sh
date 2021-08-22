cd /mnt/local/var-calling/raw_data/


sra_examples=('SRR13528220','SRR12532404','SRR10024973')

for val1 in ${sra_examples[*]}; do

	samtools sort ${val1}.bam -o ${val1}.sorted.bam -@4

done