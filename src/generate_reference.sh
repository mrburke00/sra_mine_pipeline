sudo apt-get install bwa

cd /mnt/local/

sudo mkdir var-calling
cd var-calling/
sudo mkdir -p raw_data reference_data scripts logs meta results/bwa


cd reference_data/
sudo wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/002/315/GCA_000002315.5_GRCg6a/GCA_000002315.5_GRCg6a_genomic.fna.gz
sudo gzip -d GCA_000002315.5_GRCg6a_genomic.fna.gz

sudo bwa index -p GCA GCA_000002315.5_GRCg6a_genomic.fna
