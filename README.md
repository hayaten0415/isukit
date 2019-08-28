isucon-toolkit
==============

## Packed tools
- zip
- unzip
- vim 
- tmux
- sysstat
- emacs
- dstat
- htop
- nginx
- alp (https://github.com/tkuchiki/alp)
- Percona Toolkit (pt-query-digest)
- byobu
- netdata
### netdata Depends on packages
- zlib1g-dev 
- uuid-dev 
- libuv1-dev 
- liblz4-dev 
- libjudy-dev
- libssl-dev 
- libmnl-dev 
- gcc 
- make 
- git 
- autoconf 
- autoconf-archive 
- autogen 
- automake 
- pkg-config 
- curl 
- python

## Notes
### Check first



### MySQL tuning?
- https://qiita.com/kkyouhei/items/d2c40d9e3952c7049ca3
- https://qiita.com/ihsiek/items/11106ce7a13e09b61547
- MySQLTuner-perl

### netdata 
- https://nishinatoshiharu.com/how-to-install-netdata/
- port 19999

### Prepared PlayBook Execusion 
localmachine /etc/hosts added
```
g3.isu  ${remote_ip}
```
## Dry Run 
-C

### key pair
ansible-playbook -i isucon setup.yml -u root --private-key="rsa path"

### user
ansible-playbook -i isucon -u <username>
