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
- alp (https://github.com/tkuchiki/alp) v1.0.3
- Percona Toolkit (pt-query-digest)
- byobu
- zlib1g-dev 
- uuid-dev 
- libuv1-dev 
- liblz4-dev 
- libjudy-dev
- libssl-dev 
- libmnl-dev 
- python3-pymysql 
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
- slackcat


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


## mysql_db module depends on packages
- python3-pymysql

### Loading sysctl conf file
- ☓ /etc/sysctl.conf
- ○ /etc/sysctl.d/*.conf

## Notes
### Check first
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

# Ansible Playbook Execution

## Dry Run 
-C

### key (pemkey)
ansible-playbook -i isucon setup.yml -u isucon --private-key="rsa path"

### user
ansible-playbook -i isucon -u username

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


## Before BenchMark
```
1. systemctl restart mysql
```
```
2. systemctl restart *****.ruby
```
```
3. systemctl restart nginx
```

## slackcat configure

1. configure
```
slackcat --configure
```
2. copy token
```
token issued: <copy token>
```
