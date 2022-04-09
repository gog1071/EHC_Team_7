#!/bin/bash
echo $(clear)
echo "[Thong tin he thong]"
echo "Ten may: $(uname -n)"
echo "Ten ban phan phoi: $(uname -o)"
echo "Phien ban he dieu hanh: $(uname -v )"
string=$(grep -h 'model name' /proc/cpuinfo | sort -u)
echo "Ten CPU: ${string:13}"
string=$(getconf LONG_BIT) # grep -h 'lm' /proc/cpuinfo | sort -u   OR   sudo lshw | grep 'width'
echo "CPU Bit:" ${string} "bit"
string=$(grep -h 'cpu MHz' /proc/cpuinfo | sort -u)
echo "Toc do: " ${string:11}
string=$(grep MemTotal /proc/meminfo)
echo "Thong tin bo nho vat li:" $(expr ${string:10:-3} / 1024) "MB"
string=$(df -h --total | grep total | awk '{print $4}')
echo "Thonng tin o dia con trong:" $string
echo "Danh sach dia chi IP cua he thong:" $(curl -s ident.me)  

echo "Danh sach user tren he thong:" 
cut -d: -f1 /etc/passwd | sort
echo "Thong tin cac tien trinh dang chay voi quyen root:" 
sudo ps ru | grep '^root' | sort
echo "Thong tin cac port dang mo:"
sudo netstat -tulpn | grep LISTEN | sort
echo "Danh sach cac thu muc tren he thong cho phep other co quyen ghi:"
sudo find /root/ -perm -o=w
echo "Danh sach cac goi phan mem duoc cai tren he thong:"
apt list --installed | awk '{print $1,$2}'

