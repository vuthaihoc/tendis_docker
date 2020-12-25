export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tendis/bin/deps
export PATH=$PATH:/tendis/bin

dir=/tendis_data
mkdir -p ${dir}/db
mkdir -p ${dir}/dump
mkdir -p ${dir}/log

rm /tendis_data/tendisplus.pid

/tendis/bin/tendisplus /tendis/scripts/tendisplus.conf

sleep 5

tail -f /tendis_data/log/slowlog \
 	 -f /tendis_data/log/tendisplus.INFO