export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tendis/bin/deps
export PATH=$PATH:/tendis/bin

dir=/tendis_data
mkdir -p ${dir}/db
mkdir -p ${dir}/dump
mkdir -p ${dir}/log

/tendis/bin/tendisplus /tendis/scripts/tendisplus.conf

n=0
until [ "$n" -ge 5 ]
do
   /tendis/bin/redis-cli -h 127.0.0.1 -p 51002 monitor && break  # substitute your command here
   n=$((n+1)) 
   sleep 5
done



# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tendis/bin/deps
# export PATH=$PATH:/tendis/bin

# dir=/tendis_data
# mkdir -p ${dir}/db
# mkdir -p ${dir}/dump
# mkdir -p ${dir}/log

# /tendis/bin/tendisplus /tendis/scripts/tendisplus.conf
