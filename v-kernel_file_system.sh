echo "=======please run the script as Root==============="

echo "Setting The $LFS Variable"
export LFS=/mnt/lfs

echo "disk Deatails"
fdisk -l
echo "============================================================"
echo "Enter the partation name"
read part

echo "=========================================================="

mkdir -pv $LFS
echo "part will set like this"

final=/dev/$part
echo $final
mount -v -t ext4 $final $LFS

echo "Mounting and Populating /dev"
mount -v --bind /dev $LFS/dev

echo "Mounting Virtual Kernel File Systems"

mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run


echo "In some host systems, /dev/shm is a symbolic link to /run/shm" 
echo "The /run tmpfs was mounted above so in this case only a directory needs"

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

