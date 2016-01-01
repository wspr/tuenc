sed -f sed-tulm.sed `kpsewhich t1lmr.fd`   > tulmr.fd
sed -f sed-tulm.sed `kpsewhich t1lmdh.fd`  > tulmdh.fd
sed -f sed-tulm.sed `kpsewhich t1lmss.fd`  > tulmss.fd
sed -f sed-tulm.sed `kpsewhich t1lmssq.fd` > tulmssq.fd
sed -f sed-tulm.sed `kpsewhich t1lmvtt.fd` > tulmvtt.fd

sed -f sed-tulm.sed -e \
    's/\\UnicodeFontTeXLigatures//g' `kpsewhich t1lmtt.fd` > tulmtt.fd
