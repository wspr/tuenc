#!/bin/sh

sed -f sed-uclm.sed `kpsewhich t1lmr.fd`   > uclmr.fd
sed -f sed-uclm.sed `kpsewhich t1lmss.fd`  > uclmss.fd
sed -f sed-uclm.sed -e \
    's/\\UnicodeFontTeXLigatures//g' `kpsewhich t1lmtt.fd` > uclmtt.fd
