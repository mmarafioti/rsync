#!/bin/bash

INICIO=`date +%d/%m/%Y-%H:%M:%S`
LOG=/var/log/rsync/`date +%Y-%m-%d`_log-bkp-rsync.txt

umount /dev/sdb2
#mount /media/gilson/faffc702-99de-4bdc-bdd4-277dd1cdf949

sleep 2

/bin/mount -U faffc702-99de-4bdc-bdd4-277dd1cdf949 /bkp



#/bin/mount -o rw,acl -U b472350c-d099-454a-a363-e5441e926c5f /bkp
echo " " >> $LOG
echo " " >> $LOG
echo "|-----------------------------------------------" >> $LOG
echo " Sincronização iniciada em $INICIO" >$LOG


rsync -Cravzp  -e 'ssh -p 2222' root@192.168.0.252:/backup/24-01-2018/ /bkp/24-01-2018/ >> $LOG
FINAL=`date +%d/%m/%Y-%H:%M:%S`


echo " Sincronização Finalizada em $FINAL" >$LOG
echo "|-----------------------------------------------" >> $LOG
echo " " >> $LOG
echo " " >> $LOG
