Intro
--
The code was forked from https://github.com/MonashBioinformaticsPlatform/bio-ansible and adopted to specific needs of creating an environment 
for automated execution of bacterial genome assembly pipeline (https://github.com/seru71/zao-bia-pipeline).


Requirements
--

VM or container with Ubuntu 16.04. 
Suggested resources: 

 - 16 cores
 - 16GB mem (SPAdes assembly is the most demanding step) 
 - root disk with 20GB
 - dedicated partition for results - mounted in /ngs


Setup
--

After creating the target VM/container, note its IP address (VMs_IP).
On another machine, install ansible and sshpass

`apt install -y git ansible sshpass`

Get a copy of this project
`git clone git@github.com:seru71/ngs-compute-ansible.git`
`cd ngs-compute-ansible`

Play the book
`ansible-playbook -K -k -u ngs -s -i [IP_VM], bia-pipeline-env.yml`

Other
--

Mounting network drive with input data

`ssh ngs@VM
export CREDENTIALS=/home/ngs/cifs.credentials
export LOCATION=//location/of/the/drive
sudo echo -e 'username=username\npassword=mypass' > $CREDENTIALS
sudo chmod go-rwx $CREDENTIALS
sudo mount.cifs $LOCATION /mnt/data -o credentials=$CREDENTIALS`



Credits
--

Majority of the tasks in the playbook come from https://github.com/MonashBioinformaticsPlatform/bio-ansible

Below is an extract of README from that project:
   
 1. You need to manually download some packages that require license agreements.  See `tarballs/README`

 2. There are scripts to download various databases in `scripts/`. These have deliberately not been added to ansible.

 3. Download blast databases

    cd /references/blast
    sudo -u sw-installer $(which update_blastdb.pl) --passive --verbose '.*'


