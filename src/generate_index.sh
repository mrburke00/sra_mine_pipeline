sudo apt-get install samtools
sudo apt-get install tabix
aws s3 cp s3://layerlabcu/test_chicken_sra/SRR12827866.bam SRR1287866.bam
samtools sort SRR1287866.bam -o SRR1287866.sorted.bam
samtools index SRR1287866.sorted.bam
mv SRR1287866.sorted.bam.bai SRR1287866.bam.bai
aws s3 cp SRR1287866.bam.bai s3://layerlabcu/test_chicken_sra/

sra_examples=('SRR10303811' 'SRR12532401' 'SRR12532402' 'SRR12532405' 'SRR12532406' 'SRR12532407' 'SRR12532408' 'SRR12671019' 'SRR12681011' 'SRR5827418' 'SRR5827420' 'SRR5827421')
sra_examples=('SRR12681018' 'SRR12681019' 'SRR12681020' 'SRR12681027' 'SRR12681028' 'SRR12681031' 'SRR13091898' 'SRR3050453' 'SRR3055479' 'SRR5827416' 'SRR5827419' 'SRR5827422' 'SRR8357131')    
#SRR10303810
for val1 in ${sra_examples[*]}; do

	mkdir tmp

	aws s3 cp s3://layerlabcu/test_chicken_sra/${val1}.bam ${val1}.bam 

	samtools sort ${val1}.bam -o tmp/${val1}.sorted.bam -@4
	samtools index tmp/${val1}.sorted.bam -@4

	#mv tmp/SRR5818211.sorted.bam.bai tmp/SRR5818211.bam.bai
	mv tmp/${val1}.sorted.bam.bai ${val1}.bam.bai

	#aws s3 cp tmp/SRR5818211.bam.bai s3://layerlabcu/test_chicken_sra/
	aws s3 cp ${val1}.bam.bai s3://layerlabcu/test_chicken_sra/

	#rm -r ${val1}.bam
	#rm -r tmp/

	#rm -r raw_data/${val1}_1.fastq
	#rm -r raw_data/${val1}_2.fastq
	#rm -r results/bwa/${val1}_1.bam

done