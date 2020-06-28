sudo tc qdisc del dev enp2s0 root handle 1: prio priomap 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
sudo tc qdisc del dev enp2s0 parent 1:2 handle 20: netem delay 30s
sudo tc filter del dev enp2s0 parent 1:0 protocol ip u32 match ip sport 30305 0xffff flowid 1:2
sudo tc filter del dev enp2s0 parent 1:0 protocol ip u32 match ip dport 30305 0xffff flowid 1:2

