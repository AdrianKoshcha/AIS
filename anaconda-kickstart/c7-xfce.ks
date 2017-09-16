#VERSION=RHEL7
# System authorization information
auth --enableshadow --passalgo=sha512
# Use network installation
url --url="http://mirror.rit.edu/centos/7/os/x86_64/"
repo --name=epel --baseurl="http://mirror.rit.edu/epel/7/x86_64/"
# Use graphical install
graphical
# Use text install
#text
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --activate
network  --hostname=Centos7-vm.localdomain
#Root password
rootpw --lock
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=ttubbs --password= --iscrypted --gecos="Theodore Seán Tubbs"
# use python3 -c 'import crypt; print(crypt.crypt("My Password"))' to generate a sha512
# crypt-compatible hash of your password that uses a random salt:
# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html
# Firewall configuration
firewall --enabled --ssh
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm --nohome
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --drives=sda --all --initlabel

%packages
@base
@core
@desktop-debugging
@directory-client
@fonts
@guest-agents
@guest-desktop-agents
@input-methods
@internet-browser
@java-platform
@multimedia
@network-file-system-client
@networkmanager-submodules
@print-client
@x11
@XFCE
deltarpm
lightdm
lightdm-gtk-greeter
epel-release
kexec-tools
scap-workbench

%end

%addon org_fedora_oscap
    content-type = scap-security-guide
    profile = common
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
