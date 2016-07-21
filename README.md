# Automatic Setup of my Openwrt Router

## About
These are personal script files in dash for setting up my OpenWrt router (wr941nd_v5).

## Features
After reflashing my openwrt router, I just need to run `setup.all` to do automatically:
- set up dropbear(ssh server) for automatic login with the pre-built authentication key of mine
- install the packages of `etherwake` and `iptables-mod-conntrack-extra`
- load my own script of `wol` to the router, which are used to wake up internal servers when the servers get accessed to either remotely or locally.
- [through `setup.system`] put the hostname, the timezone, and the ntp-servers, and modify the `.bashrc` for root
- [through `setup.wifi`] set the ssid, the wifi channel(13), and the key for the wifi users
- [through `setup.firewall`] set up the firewall rules for preventing brute-force network attacks
- [through `setup.firewall`] set up the firewall rules to restrict kids devices on week nights
- [through `setup.dhcp`] set up DNS settings to use google DNS servers and to assign fixed ip addresses for the desktop servers behind the router
- [through `setup.dhcp`] set up DNS settings to block access to some bad internet sites
- [through `setup.ddns`] update my domain (dzchoi.mooo.com) automatically whenever my ip address assigned from ISP gets changed

The scripts `setup.*` and `wol*` are all written in dash instead of bash. (Because as a subset language of bash, dash is more efficient than bash in speed and in memory.)
