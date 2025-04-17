#!/bin/bash
set -e

# Enable i386 architecture
dpkg --add-architecture i386

# Add Debian sid repo for i386 packages
echo "deb [arch=i386] http://deb.debian.org/debian sid main contrib non-free non-free-firmware" > /etc/apt/sources.list.d/debian-sid-i386.list

# Add apt pinning to prevent sid from being used broadly
cat <<EOF > /etc/apt/preferences.d/99sid-i386
Package: *
Pin: release a=sid
Pin-Priority: 100
EOF

# Update the repo lists
apt-get update