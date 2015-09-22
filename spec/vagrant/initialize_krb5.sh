#!/bin/bash

if [ $# -eq 0 ]; then
  echo Usage: "$0 <user1> <password1> <user2> <password2> ..." 1>&2
  exit 1
fi

if [ $(($# % 2)) -eq 1 ]; then
  echo Number of parameters is odd.  Ignored last parameter 1>&2
fi

chkconfig  krb5kdc on
service krb5kdc start

while [ $# -gt 1 ]; do
  user=$1
  password=$2
  shift; shift
  kadmin.local -q"add_principal -pw $password $user"
done
