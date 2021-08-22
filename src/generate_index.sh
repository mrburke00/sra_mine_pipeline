sudo apt-get install samtools
sudo apt-get install tabix

sra_examples=('SRR13528220','SRR12532404','SRR10024973')


for val1 in ${sra_examples[*]}; do

	samtools index ${val1}.sorted.bam -@4

done