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
- alp (https://github.com/tkuchiki/alp) v0.4.0
- Percona Toolkit (pt-query-digest)
- byobu
- netdata
## netdata Depends on packages
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

### netdata 
- https://nishinatoshiharu.com/how-to-install-netdata/
- port 19999

### Loading sysctl conf file
- ☓ /etc/sysctl.conf
- ○ /etc/sysctl.d/*.conf

## Ubuntu 18.04 LTS
### Systemd Version
237


## Notes
### Check first
- Security Group(Alibaba Cloud)
- memory size
```
cat /proc/memoinfo
```
- cpu information
```
cat /proc/cpuinfo
```
- DB software
- Web server middle




### MySQL tuning?
- https://qiita.com/kkyouhei/items/d2c40d9e3952c7049ca3
- https://qiita.com/ihsiek/items/11106ce7a13e09b61547
- https://downloads.mysql.com/presentations/20151208_02_MySQL_Tuning_for_Beginners.pdf

### netdata 
- https://nishinatoshiharu.com/how-to-install-netdata/
- port 19999

# Ansible Playbook Execution

## Dry Run 
-C

### key (pemkey)
ansible-playbook -i isucon setup.yml -u isucon --private-key="rsa path"

### user
ansible-playbook -i isucon -u <username>

# ISUCON Cheat Sheet
## h2o alp format(ltsv)

```
/etc/h2o/h2o.conf
access-log:
  path: /var/log/h2o/access.log
  format: "time:%t\thost:%h\treq:%r\tstatus:%s\turi:%U\tmethod:%m\tsize:%b\treferer:%{Referer}i\tua:%{User-Agent}i\tcache:%{X-Cache}o\truntime:%{X-Runtime}o\tvhost:%{Host}i\treqtime:%{request-total-time}x\truntime:%{process-time}x\tapptime:%{duration}x"
```
## apache alp format(https://github.com/tkuchiki/alp/blob/master/README.ja.md#apache)
```
/etc/apache2/apache2.conf
LogFormat "time:%t\tforwardedfor:%{X-Forwarded-For}i\thost:%h\treq:%r\tstatus:%>s\tmethod:%m\turi:%U%q\tsize:%B\treferer:%{Referer}i\tua:%{User-Agent}i\treqtime_microsec:%D\tapptime:%D\tcache:%{X-Cache}o\truntime:%{X-Runtime}o\tvhost:%{Host}i" combined
```
## apache default access log
```
/var/log/apache2/access.log
```

## access log analyze by alp
```
cat /var/log/h2o/access.log | alp ltsv
```



