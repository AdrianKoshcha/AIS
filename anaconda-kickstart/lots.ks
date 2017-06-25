#version=RHEL7
# System authorization information
auth --enableshadow --passalgo=sha512
# Use network installation
url --url="http://mirror.rit.edu/centos/7/os/x86_64/"
repo --name="epel" --mirrorlist="https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch"
repo --name="packages-microsoft-com-prod" --baseurl="https://packages.microsoft.com/rhel/7/prod/"
repo --name="elrepo-kernel" --baseurl="https://elrepo.org/linux/kernel/el7/x86_64/"
repo --name="keybase" --baseurl="http://prerelease.keybase.io/rpm/x86_64"
repo --name="visual-studio-code" --baseurl="https://packages.microsoft.com/yumrepos/vscode"
# Use graphical install
graphical
# Firewall configuration
firewall --enabled --service=ssh
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=enp1s0 --ipv6=auto --activate
network  --hostname=localhost.localdomain

#Root password
rootpw --lock
# System services
services --enabled="chronyd"
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=ttubbs --password=$6$CNMu6uxixs2PBC7t$6R.D/22kxDqI.SIUAa9CxcSW2Vvejy7UeFtmdEe1pgsdAEsjGbI2pvo14WFdhZUfEoxUr0IIJjgpLabYo.jsw/ --iscrypted --gecos="Theodore Seán Tubbs"
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel --drives=sda

%packages
@XFCE
@base
@core
@desktop-debugging
@directory-client
@fonts
@input-methods
@internet-browser
@java-platform
@multimedia
@network-file-system-client
@networkmanager-submodules
@print-client
@x11
chrony
elrepo-release
kernel-ml
epel-release
packages-microsoft-prod
keybase
code
powershell
kexec-tools
openscap
openscap-scanner
scap-security-guide
scap-workbench
%end

%addon org_fedora_oscap
    content-type = scap-security-guide
    profile = common
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
