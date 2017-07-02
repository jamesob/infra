
# infra

## Provisioning ali

0. Ensure all physical disks are formatted and mounted using `lvm`.
  - `sudo pvdisplay`
  - `sudo lvdisplay`
  - `sudo vgdisplay`
0. Ensure networking is static vs. DHCP:
```
$ cat /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo enp2s0
iface lo inet loopback

iface enp2s0 inet static
address 192.168.1.155
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 8.8.8.8
```
0. Run `ansible-playbook -i "192.168.1.155," ubuntu.yaml`
0. Run `ansible-playbook -i "192.168.1.155," ali.yaml`
