#### nfs-server
```bash
$ apt-get install nfs-kernel-server

$ vi /etc/exports
  # /etc/exports: the access control list for filesystems which may be exported
  #               to NFS clients.  See exports(5).
  #
  # Example for NFSv2 and NFSv3:
  # /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
  #
  # Example for NFSv4:
  # /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
  # /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
  #
  /mnt/nfs-1 *(rw,fsid=0,sync,no_subtree_check,no_auth_nlm,insecure,no_root_squash)
  
$ /etc/init.d/nfs-kernel-server reload
$ /etc/init.d/nfs-kernel-server restart
```
查看
```bash
# -a 显示已经于客户端连接上的目录信息
# -e IP或者hostname 显示此IP地址分享出来的目录
$ showmount -e

# 查看rpc执行信息，可以用于检测rpc运行情况的工具，利用rpcinfo -p 可以查看出RPC开启的端口所提供的程序有哪些。
$ rpcinfo -p

# 卸载所有共享目录
$ exportfs -au 

# 重新共享所有目录并输出详细信息
$ exportfs -rv 

# nfsstat 命令显示关于 NFS 和到内核的远程过程调用（RPC）接口的统计信息
$ nfsstat
```
#### nfs-client
