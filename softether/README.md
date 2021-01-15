# Softether VPN

## Objects
1. Deliever softether vpn server with preset
2. Use multi-stage build to integrate vpn server to any other container images.

## Configuration

### User
administrator password: bepro common password (l..)

VPN user:
    - name: bepro
    - password: bepro common password (l..)

### protocols

1. L2TP/IPsec with pre-shared key.
    - pre-shared key: lMVin2k9rQQFq3VVIJwkPRt5SAOu0Kn_AL03zZoZ194
2. OpenVPN with customized port(UDP 1278).

Softether VPN is disabled since so many scanner/probe tries to connect opened 443 port.


### etc
1. Disabled Web interface
2. Disabled *.softether.net ddns, keepalive
3. AutoDeleteCheckDiskFreeSpaceMin to 1048576000 (1GB).
4. change cipher to AES256-SHA256

