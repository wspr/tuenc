/^%.*/d
s/{T1}/{UC}/g
s/t1lm/tulm/g

s/ec-lmri\([0-9]*\)/lmroman\1-italic/g
s/ec-lmro\([0-9]*\)/lmromanslant\1-regular/g
s/ec-lmr\([0-9]*\)/lmroman\1-regular/g
s/ec-lmcsco\([0-9]*\)/lmromancaps\1-oblique/g
s/ec-lmcsc\([0-9]*\)/lmromancaps\1-regular/g

s/ec-lmbxo\([0-9]*\)/lmromanslant\1-bold/g
s/ec-lmbxi\([0-9]*\)/lmroman\1-bolditalic/g
s/ec-lmbx\([0-9]*\)/lmroman\1-bold/g
s/ec-lmbo\([0-9]*\)/lmromandemi\1-oblique/g
s/ec-lmb\([0-9]*\)/lmromandemi\1-regular/g

s/ec-lmdunh\([0-9]*\)/lmromandunh\1-regular/g
s/ec-lmduno\([0-9]*\)/lmromandunh\1-oblique/g

s/ec-lmss\([0-9]\{1,\}\)/lmsans\1-regular/g
s/ec-lmsso\([0-9]\{1,\}\)/lmsans\1-oblique/g

s/ec-lmssdc\([0-9]\{1,\}\)/lmsansdemicond\1-regular/g
s/ec-lmssdo\([0-9]\{1,\}\)/lmsansdemicond\1-oblique/g

s/ec-lmssbx\([0-9]\{1,\}\)/lmsans\1-bold/g
s/ec-lmssbo\([0-9]\{1,\}\)/lmsans\1-boldoblique/g

s/ec-lmssq\([0-9]\{1,\}\)/lmsansquot\1-regular/g
s/ec-lmssqo\([0-9]\{1,\}\)/lmsansquot\1-oblique/g
s/ec-lmssqbx\([0-9]\{1,\}\)/lmsansquot\1-bold/g
s/ec-lmssqbo\([0-9]\{1,\}\)/lmsansquot\1-boldoblique/g

s/ec-lmtt\([0-9]\{1,\}\)/lmmono\1-regular/g
s/ec-lmtto\([0-9]\{1,\}\)/lmmonoslant\1-regular/g
s/ec-lmtti\([0-9]\{1,\}\)/lmmono\1-italic/g

s/ec-lmtcsc\([0-9]\{1,\}\)/lmmonocaps\1-regular/g
s/ec-lmtcso\([0-9]\{1,\}\)/lmmonocaps\1-oblique/g

s/ec-lmtl\([0-9]\{1,\}\)/lmmonolt\1-regular/g
s/ec-lmtlo\([0-9]\{1,\}\)/lmmonolt\1-oblique/g
s/ec-lmtk\([0-9]\{1,\}\)/lmmonolt\1-bold/g
s/ec-lmtko\([0-9]\{1,\}\)/lmmonolt\1-boldoblique/g

s/ec-lmtlc\([0-9]\{1,\}\)/lmmonoltcond\1-regular/g
s/ec-lmtlco\([0-9]\{1,\}\)/lmmonoltcond\1-oblique/g

s/ec-lmvtt\([0-9]\{1,\}\)/lmmonoprop\1-regular/g
s/ec-lmvtto\([0-9]\{1,\}\)/lmmonoprop\1-oblique/g

s/ec-lmvtl\([0-9]\{1,\}\)/lmmonoproplt\1-regular/g
s/ec-lmvtlo\([0-9]\{1,\}\)/lmmonoproplt\1-oblique/g
s/ec-lmvtk\([0-9]\{1,\}\)/lmmonoproplt\1-bold/g
s/ec-lmvtko\([0-9]\{1,\}\)/lmmonoproplt\1-boldoblique/g

s/\(>.[ ]*\)\(lm[a-z0-9\-]\{1,\}\)/\1\\UnicodeFontFile{\2}{\\UnicodeFontTeXLigatures}/g
