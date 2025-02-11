

# Virtual Memory Card Creation on Linux

This guide demonstrates how to create and mount a virtual memory card using Linux commands. A virtual memory card simulates the functionality of a real storage device, which can be used to store and transfer data as a regular memory card would.

## Prerequisites

Before proceeding, ensure you have the following:

- A Linux-based system (tested on Ubuntu).
- `dd` and `mkfs` commands installed (usually pre-installed on most distributions).
- Root or sudo privileges to perform system-level operations.

## Steps to Create a Virtual Memory Card

### 1. Create a Virtual Disk File
The first step is to create an empty file that will act as the virtual memory card 1 GB. You can do this using the `dd` command.

```bash
sudo dd if=/dev/zero of=sd.img bs=1M count=1024
```
 ![Subdirectory Image](images/dd.png)
This command creates a 100 MB file named `virtual_memory_card.img`. You can adjust the size by changing the `count` value (in MB).

- `if=/dev/zero`: Specifies the input source (a file filled with zeroes).
- `of=sd.img`: Specifies the output file (your virtual memory card).
- `bs=1M`: Defines the block size (1 MB in this case).
- `count=1024`: Specifies the number of blocks to write (1 GB).

### 2. Format Different partitions of virtual sd card 

 using `cfdisk` command to create the header MBR with type `FAT16` making it bootable to carry `U-boot` with size 200Mand the second partition is the Linux Partition
 Here is the detailed Steps :
  
  ![Subdirectory Image](images/dos.png)
  ![Subdirectory Image](images/1.png)
  ![Subdirectory Image](images/2.png)
  ![Subdirectory Image](images/3.png)
  ![Subdirectory Image](images/4.png)
  ![Subdirectory Image](images/5.png)
  ![Subdirectory Image](images/6.png)
  ![Subdirectory Image](images/7.png)
  ![Subdirectory Image](images/8.png)
  ![Subdirectory Image](images/9.png)
  ![Subdirectory Image](images/10.png)
  ![Subdirectory Image](images/11.png)
  ![Subdirectory Image](images/MBR.png)
  

 Attach the virtual disk to a loop device to allow cfdisk to interact with it:
```bash
sudo losetup --partscan-f sd.img
```
    -f: Finds an available loop device.
    
  ![Subdirectory Image](images/losetup.png)
    in my case the virtual disk attached to loop17    
### 3. Format the Virtual Memory Card
Next, format the virtual memory card using the `mkfs` command. You can choose any filesystem type. Below, we use `vfat`:

```bash
sudo mkfs.vfat -F 16 -n boot /dev/loop17p1
```

This creates an vfat filesystem within the `sd.img` file. You can replace `vfat` with other filesystems like `ext4` or `ntfs` based on your needs.

### 4. Create a Mount Point
Create a directory to mount the virtual memory card.

```bash
mkdir /mnt
```

This will be the mount point for the virtual memory card.

### 5. Mount the Virtual Memory Card
Now, mount the virtual memory card to the directory you created.

```bash
sudo mount /dev/loop17p1 ./mnt

```
- `/mnt`: The directory where the virtual memory card will be mounted.


### 7. Unmount the Virtual Memory Card
Once you're done using the virtual memory card, unmount it with the following command:

```bash
sudo umount /dev/loop17p1 
```
![Subdirectory Image](images/mkfs.png)
![Subdirectory Image](images/lsblk.png)
