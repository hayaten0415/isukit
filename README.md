isucon-toolkit
==============

## Packed tools
- zsh
- tmux
- emacs
- git
- dstat
- htop
- Ruby 2.5
- nginx
- alp (https://github.com/tkuchiki/alp)
- MySQL 8.0 GA
- mysqldef
- Percona Toolkit (pt-query-digest)

## Notes
### Check first
#### Is Software Collections enabled?
```
$ rpm -qa centos-release-scl
```

#### What version of Ruby is installed, and where?
```
$ ruby -v
$ which ruby  # If under /opt/rh, it's from SCL
```

### MySQL 8.0: Obtaining generated root password
```
grep "temporary password" /var/log/mysqld.log
```

### MySQL tuning?
- https://qiita.com/kkyouhei/items/d2c40d9e3952c7049ca3
- MySQLTuner-perl
