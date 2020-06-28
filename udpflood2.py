import socket
import threading
window_size = 1
no_of_packets_in_transit = 0
ipn = int(input("Enter Target Port Number : "))
ipa='127.0.0.1'
sender = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
stra = ''
for i in range(1024):
	stra = stra + '0'
while True :
	sender.sendto(stra.encode(),(ipa,ipn))
