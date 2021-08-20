cd /mnt/local/

sudo mkdir var-calling
cd var-calling
sudo mkdir -p raw_data reference_data scripts logs meta results/bwa

sudo chmod ugo+wx /mnt/local/var-calling/
sudo chmod ugo+wx /mnt/local/var-calling/raw_data

cd raw_data/

sra_examples=('SRR12827888' 'SRR2131205' 'SRR12827887')
for val1 in ${sra_examples[*]}; do
	prefetch $val1 --max-size 60g
	fasterq-dump $val1
	rm -r ${val1}
done


