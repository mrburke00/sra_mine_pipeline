sudo mkdir /mnt/local || :
export TMPDIR=/mnt/local/temp
sudo mkfs -t ext4 /dev/nvme0n1 || :
sudo mount /dev/nvme0n1 /mnt/local || :
sudo chmod ugo+wx /mnt/local
cd /.
cd /mnt/local

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install awscli

wget --output-document sratoolkit.tar.gz http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -vxzf sratoolkit.tar.gz