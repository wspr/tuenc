
--[[
Start off with a definition for unicode glyph slot names.
These need to be consistent because they're used programmatically.
Note that we could have defined this in a more "nested"-like structure,
but this would have made it less clear that we're talking about input
and output characters here, not abstractions.
--]]

require('umath-glyph-names.lua')

latin_upper = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}
latin_lower = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

--[[

# Define the mappings

Basically what we want here is to end up with a nested table structure that looks like

math_map = {
  ["italic"] = { ["mrmA"] = "mitA" , ["mrmB"] = "mrmB" , ... }
  ["bold"]   = { ["mrmA"] = "mbfA" , ["mrmB"] = "mbfB" , ... }
}

So to do this we define:

 * What the "name" of the math alphabet is ("italic", "bold", ...) (this is loop 1)
 * What the "prefix" of it is ("mit", "mbf")
 * What alphabets need to be included (this is loop 2)

Each alphabet is defined in terms of a series of slot names (this is loop 3).

This setup makes things nice and general, and we can define arbitrary alphabets as long as the
glyph naming scheme is consistent. If the glyph names are NOT consistent, we need to augment
the resulting structure manually. This is probably easier than making the construction code
any more convoluted!

--]]

mathalph = {}
mathalph.italic = { ["prefix"] = "mit" , ["alphlist"] = {latin_upper,latin_lower} }
mathalph.bold   = { ["prefix"] = "mbf" , ["alphlist"] = {latin_upper,latin_lower} }

math_map = {}
input_prefix = 'mrm'

for mathalph_name,thismathalph in pairs(mathalph) do
  math_map[mathalph_name] = {}
  for i,alphlist in pairs(thismathalph.alphlist) do
    for ii,slotname in pairs(alphlist) do
      math_map[mathalph_name][input_prefix..slotname] = thismathalph.prefix..slotname
    end
  end
end

math_map.bolditalic = {
    ["0041"] = "1D468" , -- \mbfitA
    ["0042"] = "1D469" , -- \mbfitB
    ["0043"] = "1D46A" , -- \mbfitC
    ["0044"] = "1D46B" , -- \mbfitD
    ["0045"] = "1D46C" , -- \mbfitE
    ["0046"] = "1D46D" , -- \mbfitF
    ["0047"] = "1D46E" , -- \mbfitG
    ["0048"] = "1D46F" , -- \mbfitH
    ["0049"] = "1D470" , -- \mbfitI
    ["004A"] = "1D471" , -- \mbfitJ
    ["004B"] = "1D472" , -- \mbfitK
    ["004C"] = "1D473" , -- \mbfitL
    ["004D"] = "1D474" , -- \mbfitM
    ["004E"] = "1D475" , -- \mbfitN
    ["004F"] = "1D476" , -- \mbfitO
    ["0050"] = "1D477" , -- \mbfitP
    ["0051"] = "1D478" , -- \mbfitQ
    ["0052"] = "1D479" , -- \mbfitR
    ["0053"] = "1D47A" , -- \mbfitS
    ["0054"] = "1D47B" , -- \mbfitT
    ["0055"] = "1D47C" , -- \mbfitU
    ["0056"] = "1D47D" , -- \mbfitV
    ["0057"] = "1D47E" , -- \mbfitW
    ["0058"] = "1D47F" , -- \mbfitX
    ["0059"] = "1D480" , -- \mbfitY
    ["005A"] = "1D481" , -- \mbfitZ
    ["0061"] = "1D482" , -- \mbfita
    ["0062"] = "1D483" , -- \mbfitb
    ["0063"] = "1D484" , -- \mbfitc
    ["0064"] = "1D485" , -- \mbfitd
    ["0065"] = "1D486" , -- \mbfite
    ["0066"] = "1D487" , -- \mbfitf
    ["0067"] = "1D488" , -- \mbfitg
    ["0068"] = "1D489" , -- \mbfith
    ["0069"] = "1D48A" , -- \mbfiti
    ["006A"] = "1D48B" , -- \mbfitj
    ["006B"] = "1D48C" , -- \mbfitk
    ["006C"] = "1D48D" , -- \mbfitl
    ["006D"] = "1D48E" , -- \mbfitm
    ["006E"] = "1D48F" , -- \mbfitn
    ["006F"] = "1D490" , -- \mbfito
    ["0070"] = "1D491" , -- \mbfitp
    ["0071"] = "1D492" , -- \mbfitq
    ["0072"] = "1D493" , -- \mbfitr
    ["0073"] = "1D494" , -- \mbfits
    ["0074"] = "1D495" , -- \mbfitt
    ["0075"] = "1D496" , -- \mbfitu
    ["0076"] = "1D497" , -- \mbfitv
    ["0077"] = "1D498" , -- \mbfitw
    ["0078"] = "1D499" , -- \mbfitx
    ["0079"] = "1D49A" , -- \mbfity
    ["007A"] = "1D49B" , -- \mbfitz
  }

math_map.scr = {
    ["0041"] = "1D49C" , -- \mscrA
    ["0042"] = "0212C" ,
    ["0043"] = "1D49E" , -- \mscrC
    ["0044"] = "1D49F" , -- \mscrD
    ["0045"] = "02130" ,
    ["0046"] = "02131" ,
    ["0047"] = "1D4A2" , -- \mscrG
    ["0048"] = "0210B" ,
    ["0049"] = "02110" ,
    ["004A"] = "1D4A5" , -- \mscrJ
    ["004B"] = "1D4A6" , -- \mscrK
    ["004C"] = "02112" ,
    ["004D"] = "02133" ,
    ["004E"] = "1D4A9" , -- \mscrN
    ["004F"] = "1D4AA" , -- \mscrO
    ["0050"] = "1D4AB" , -- \mscrP
    ["0051"] = "1D4AC" , -- \mscrQ
    ["0052"] = "0211B" ,
    ["0053"] = "1D4AE" , -- \mscrS
    ["0054"] = "1D4AF" , -- \mscrT
    ["0055"] = "1D4B0" , -- \mscrU
    ["0056"] = "1D4B1" , -- \mscrV
    ["0057"] = "1D4B2" , -- \mscrW
    ["0058"] = "1D4B3" , -- \mscrX
    ["0059"] = "1D4B4" , -- \mscrY
    ["005A"] = "1D4B5" , -- \mscrZ
    ["0061"] = "1D4B6" , -- \mscra
    ["0062"] = "1D4B7" , -- \mscrb
    ["0063"] = "1D4B8" , -- \mscrc
    ["0064"] = "1D4B9" , -- \mscrd
    ["0065"] = "0212F" ,
    ["0066"] = "1D4BB" , -- \mscrf
    ["0067"] = "0210A" ,
    ["0068"] = "1D4BD" , -- \mscrh
    ["0069"] = "1D4BE" , -- \mscri
    ["006A"] = "1D4BF" , -- \mscrj
    ["006B"] = "1D4C0" , -- \mscrk
    ["006C"] = "1D4C1" , -- \mscrl
    ["006D"] = "1D4C2" , -- \mscrm
    ["006E"] = "1D4C3" , -- \mscrn
    ["006F"] = "02134" ,
    ["0070"] = "1D4C5" , -- \mscrp
    ["0071"] = "1D4C6" , -- \mscrq
    ["0072"] = "1D4C7" , -- \mscrr
    ["0073"] = "1D4C8" , -- \mscrs
    ["0074"] = "1D4C9" , -- \mscrt
    ["0075"] = "1D4CA" , -- \mscru
    ["0076"] = "1D4CB" , -- \mscrv
    ["0077"] = "1D4CC" , -- \mscrw
    ["0078"] = "1D4CD" , -- \mscrx
    ["0079"] = "1D4CE" , -- \mscry
    ["007A"] = "1D4CF" , -- \mscrz
  }

math_map.boldscr = {
    ["0041"] = "1D4D0" , -- \mbfscrA
    ["0042"] = "1D4D1" , -- \mbfscrB
    ["0043"] = "1D4D2" , -- \mbfscrC
    ["0044"] = "1D4D3" , -- \mbfscrD
    ["0045"] = "1D4D4" , -- \mbfscrE
    ["0046"] = "1D4D5" , -- \mbfscrF
    ["0047"] = "1D4D6" , -- \mbfscrG
    ["0048"] = "1D4D7" , -- \mbfscrH
    ["0049"] = "1D4D8" , -- \mbfscrI
    ["004A"] = "1D4D9" , -- \mbfscrJ
    ["004B"] = "1D4DA" , -- \mbfscrK
    ["004C"] = "1D4DB" , -- \mbfscrL
    ["004D"] = "1D4DC" , -- \mbfscrM
    ["004E"] = "1D4DD" , -- \mbfscrN
    ["004F"] = "1D4DE" , -- \mbfscrO
    ["0050"] = "1D4DF" , -- \mbfscrP
    ["0051"] = "1D4E0" , -- \mbfscrQ
    ["0052"] = "1D4E1" , -- \mbfscrR
    ["0053"] = "1D4E2" , -- \mbfscrS
    ["0054"] = "1D4E3" , -- \mbfscrT
    ["0055"] = "1D4E4" , -- \mbfscrU
    ["0056"] = "1D4E5" , -- \mbfscrV
    ["0057"] = "1D4E6" , -- \mbfscrW
    ["0058"] = "1D4E7" , -- \mbfscrX
    ["0059"] = "1D4E8" , -- \mbfscrY
    ["005A"] = "1D4E9" , -- \mbfscrZ
    ["0061"] = "1D4EA" , -- \mbfscra
    ["0062"] = "1D4EB" , -- \mbfscrb
    ["0063"] = "1D4EC" , -- \mbfscrc
    ["0064"] = "1D4ED" , -- \mbfscrd
    ["0065"] = "1D4EE" , -- \mbfscre
    ["0066"] = "1D4EF" , -- \mbfscrf
    ["0067"] = "1D4F0" , -- \mbfscrg
    ["0068"] = "1D4F1" , -- \mbfscrh
    ["0069"] = "1D4F2" , -- \mbfscri
    ["006A"] = "1D4F3" , -- \mbfscrj
    ["006B"] = "1D4F4" , -- \mbfscrk
    ["006C"] = "1D4F5" , -- \mbfscrl
    ["006D"] = "1D4F6" , -- \mbfscrm
    ["006E"] = "1D4F7" , -- \mbfscrn
    ["006F"] = "1D4F8" , -- \mbfscro
    ["0070"] = "1D4F9" , -- \mbfscrp
    ["0071"] = "1D4FA" , -- \mbfscrq
    ["0072"] = "1D4FB" , -- \mbfscrr
    ["0073"] = "1D4FC" , -- \mbfscrs
    ["0074"] = "1D4FD" , -- \mbfscrt
    ["0075"] = "1D4FE" , -- \mbfscru
    ["0076"] = "1D4FF" , -- \mbfscrv
    ["0077"] = "1D500" , -- \mbfscrw
    ["0078"] = "1D501" , -- \mbfscrx
    ["0079"] = "1D502" , -- \mbfscry
    ["007A"] = "1D503" , -- \mbfscrz
}

math_map.frak = {
    ["0041"] = "1D504" , -- \mfrakA
    ["0042"] = "1D505" , -- \mfrakB
    ["0043"] = "0212D" ,
    ["0044"] = "1D507" , -- \mfrakD
    ["0045"] = "1D508" , -- \mfrakE
    ["0046"] = "1D509" , -- \mfrakF
    ["0047"] = "1D50A" , -- \mfrakG
    ["0048"] = "0210C" ,
    ["0049"] = "02111" ,
    ["004A"] = "1D50D" , -- \mfrakJ
    ["004B"] = "1D50E" , -- \mfrakK
    ["004C"] = "1D50F" , -- \mfrakL
    ["004D"] = "1D510" , -- \mfrakM
    ["004E"] = "1D511" , -- \mfrakN
    ["004F"] = "1D512" , -- \mfrakO
    ["0050"] = "1D513" , -- \mfrakP
    ["0051"] = "1D514" , -- \mfrakQ
    ["0052"] = "0211C" ,
    ["0053"] = "1D516" , -- \mfrakS
    ["0054"] = "1D517" , -- \mfrakT
    ["0055"] = "1D518" , -- \mfrakU
    ["0056"] = "1D519" , -- \mfrakV
    ["0057"] = "1D51A" , -- \mfrakW
    ["0058"] = "1D51B" , -- \mfrakX
    ["0059"] = "1D51C" , -- \mfrakY
    ["005A"] = "02128" ,
    ["0061"] = "1D51E" , -- \mfraka
    ["0062"] = "1D51F" , -- \mfrakb
    ["0063"] = "1D520" , -- \mfrakc
    ["0064"] = "1D521" , -- \mfrakd
    ["0065"] = "1D522" , -- \mfrake
    ["0066"] = "1D523" , -- \mfrakf
    ["0067"] = "1D524" , -- \mfrakg
    ["0068"] = "1D525" , -- \mfrakh
    ["0069"] = "1D526" , -- \mfraki
    ["006A"] = "1D527" , -- \mfrakj
    ["006B"] = "1D528" , -- \mfrakk
    ["006C"] = "1D529" , -- \mfrakl
    ["006D"] = "1D52A" , -- \mfrakm
    ["006E"] = "1D52B" , -- \mfrakn
    ["006F"] = "1D52C" , -- \mfrako
    ["0070"] = "1D52D" , -- \mfrakp
    ["0071"] = "1D52E" , -- \mfrakq
    ["0072"] = "1D52F" , -- \mfrakr
    ["0073"] = "1D530" , -- \mfraks
    ["0074"] = "1D531" , -- \mfrakt
    ["0075"] = "1D532" , -- \mfraku
    ["0076"] = "1D533" , -- \mfrakv
    ["0077"] = "1D534" , -- \mfrakw
    ["0078"] = "1D535" , -- \mfrakx
    ["0079"] = "1D536" , -- \mfraky
    ["007A"] = "1D537" , -- \mfrakz
}

math_map.boldfrak = {
    ["0041"] = "1D56C" , -- \mbffrakA
    ["0042"] = "1D56D" , -- \mbffrakB
    ["0043"] = "1D56E" , -- \mbffrakC
    ["0044"] = "1D56F" , -- \mbffrakD
    ["0045"] = "1D570" , -- \mbffrakE
    ["0046"] = "1D571" , -- \mbffrakF
    ["0047"] = "1D572" , -- \mbffrakG
    ["0048"] = "1D573" , -- \mbffrakH
    ["0049"] = "1D574" , -- \mbffrakI
    ["004A"] = "1D575" , -- \mbffrakJ
    ["004B"] = "1D576" , -- \mbffrakK
    ["004C"] = "1D577" , -- \mbffrakL
    ["004D"] = "1D578" , -- \mbffrakM
    ["004E"] = "1D579" , -- \mbffrakN
    ["004F"] = "1D57A" , -- \mbffrakO
    ["0050"] = "1D57B" , -- \mbffrakP
    ["0051"] = "1D57C" , -- \mbffrakQ
    ["0052"] = "1D57D" , -- \mbffrakR
    ["0053"] = "1D57E" , -- \mbffrakS
    ["0054"] = "1D57F" , -- \mbffrakT
    ["0055"] = "1D580" , -- \mbffrakU
    ["0056"] = "1D581" , -- \mbffrakV
    ["0057"] = "1D582" , -- \mbffrakW
    ["0058"] = "1D583" , -- \mbffrakX
    ["0059"] = "1D584" , -- \mbffrakY
    ["005A"] = "1D585" , -- \mbffrakZ
    ["0061"] = "1D586" , -- \mbffraka
    ["0062"] = "1D587" , -- \mbffrakb
    ["0063"] = "1D588" , -- \mbffrakc
    ["0064"] = "1D589" , -- \mbffrakd
    ["0065"] = "1D58A" , -- \mbffrake
    ["0066"] = "1D58B" , -- \mbffrakf
    ["0067"] = "1D58C" , -- \mbffrakg
    ["0068"] = "1D58D" , -- \mbffrakh
    ["0069"] = "1D58E" , -- \mbffraki
    ["006A"] = "1D58F" , -- \mbffrakj
    ["006B"] = "1D590" , -- \mbffrakk
    ["006C"] = "1D591" , -- \mbffrakl
    ["006D"] = "1D592" , -- \mbffrakm
    ["006E"] = "1D593" , -- \mbffrakn
    ["006F"] = "1D594" , -- \mbffrako
    ["0070"] = "1D595" , -- \mbffrakp
    ["0071"] = "1D596" , -- \mbffrakq
    ["0072"] = "1D597" , -- \mbffrakr
    ["0073"] = "1D598" , -- \mbffraks
    ["0074"] = "1D599" , -- \mbffrakt
    ["0075"] = "1D59A" , -- \mbffraku
    ["0076"] = "1D59B" , -- \mbffrakv
    ["0077"] = "1D59C" , -- \mbffrakw
    ["0078"] = "1D59D" , -- \mbffrakx
    ["0079"] = "1D59E" , -- \mbffraky
    ["007A"] = "1D59F" , -- \mbffrakz
  }

math_map.bb = {
    ["0041"] = "1D538" , -- \BbbA
    ["0042"] = "1D539" , -- \BbbB
    ["0043"] = "02102" ,
    ["0044"] = "1D53B" , -- \BbbD
    ["0045"] = "1D53C" , -- \BbbE
    ["0046"] = "1D53D" , -- \BbbF
    ["0047"] = "1D53E" , -- \BbbG
    ["0048"] = "0210D" ,
    ["0049"] = "1D540" , -- \BbbI
    ["004A"] = "1D541" , -- \BbbJ
    ["004B"] = "1D542" , -- \BbbK
    ["004C"] = "1D543" , -- \BbbL
    ["004D"] = "1D544" , -- \BbbM
    ["004E"] = "02115" ,
    ["004F"] = "1D546" , -- \BbbO
    ["0050"] = "02119" ,
    ["0051"] = "0211A" ,
    ["0052"] = "0211D" ,
    ["0053"] = "1D54A" , -- \BbbS
    ["0054"] = "1D54B" , -- \BbbT
    ["0055"] = "1D54C" , -- \BbbU
    ["0056"] = "1D54D" , -- \BbbV
    ["0057"] = "1D54E" , -- \BbbW
    ["0058"] = "1D54F" , -- \BbbX
    ["0059"] = "1D550" , -- \BbbY
    ["005A"] = "02124" ,
    ["0061"] = "1D552" , -- \Bbba
    ["0062"] = "1D553" , -- \Bbbb
    ["0063"] = "1D554" , -- \Bbbc
    ["0064"] = "1D555" , -- \Bbbd
    ["0065"] = "1D556" , -- \Bbbe
    ["0066"] = "1D557" , -- \Bbbf
    ["0067"] = "1D558" , -- \Bbbg
    ["0068"] = "1D559" , -- \Bbbh
    ["0069"] = "1D55A" , -- \Bbbi
    ["006A"] = "1D55B" , -- \Bbbj
    ["006B"] = "1D55C" , -- \Bbbk
    ["006C"] = "1D55D" , -- \Bbbl
    ["006D"] = "1D55E" , -- \Bbbm
    ["006E"] = "1D55F" , -- \Bbbn
    ["006F"] = "1D560" , -- \Bbbo
    ["0070"] = "1D561" , -- \Bbbp
    ["0071"] = "1D562" , -- \Bbbq
    ["0072"] = "1D563" , -- \Bbbr
    ["0073"] = "1D564" , -- \Bbbs
    ["0074"] = "1D565" , -- \Bbbt
    ["0075"] = "1D566" , -- \Bbbu
    ["0076"] = "1D567" , -- \Bbbv
    ["0077"] = "1D568" , -- \Bbbw
    ["0078"] = "1D569" , -- \Bbbx
    ["0079"] = "1D56A" , -- \Bbby
    ["007A"] = "1D56B" , -- \Bbbz
  }

math_map.tt = {
    ["0041"] = "1D670" , -- \mttA
    ["0042"] = "1D671" , -- \mttB
    ["0043"] = "1D672" , -- \mttC
    ["0044"] = "1D673" , -- \mttD
    ["0045"] = "1D674" , -- \mttE
    ["0046"] = "1D675" , -- \mttF
    ["0047"] = "1D676" , -- \mttG
    ["0048"] = "1D677" , -- \mttH
    ["0049"] = "1D678" , -- \mttI
    ["004A"] = "1D679" , -- \mttJ
    ["004B"] = "1D67A" , -- \mttK
    ["004C"] = "1D67B" , -- \mttL
    ["004D"] = "1D67C" , -- \mttM
    ["004E"] = "1D67D" , -- \mttN
    ["004F"] = "1D67E" , -- \mttO
    ["0050"] = "1D67F" , -- \mttP
    ["0051"] = "1D680" , -- \mttQ
    ["0052"] = "1D681" , -- \mttR
    ["0053"] = "1D682" , -- \mttS
    ["0054"] = "1D683" , -- \mttT
    ["0055"] = "1D684" , -- \mttU
    ["0056"] = "1D685" , -- \mttV
    ["0057"] = "1D686" , -- \mttW
    ["0058"] = "1D687" , -- \mttX
    ["0059"] = "1D688" , -- \mttY
    ["005A"] = "1D689" , -- \mttZ
    ["0061"] = "1D68A" , -- \mtta
    ["0062"] = "1D68B" , -- \mttb
    ["0063"] = "1D68C" , -- \mttc
    ["0064"] = "1D68D" , -- \mttd
    ["0065"] = "1D68E" , -- \mtte
    ["0066"] = "1D68F" , -- \mttf
    ["0067"] = "1D690" , -- \mttg
    ["0068"] = "1D691" , -- \mtth
    ["0069"] = "1D692" , -- \mtti
    ["006A"] = "1D693" , -- \mttj
    ["006B"] = "1D694" , -- \mttk
    ["006C"] = "1D695" , -- \mttl
    ["006D"] = "1D696" , -- \mttm
    ["006E"] = "1D697" , -- \mttn
    ["006F"] = "1D698" , -- \mtto
    ["0070"] = "1D699" , -- \mttp
    ["0071"] = "1D69A" , -- \mttq
    ["0072"] = "1D69B" , -- \mttr
    ["0073"] = "1D69C" , -- \mtts
    ["0074"] = "1D69D" , -- \mttt
    ["0075"] = "1D69E" , -- \mttu
    ["0076"] = "1D69F" , -- \mttv
    ["0077"] = "1D6A0" , -- \mttw
    ["0078"] = "1D6A1" , -- \mttx
    ["0079"] = "1D6A2" , -- \mtty
    ["007A"] = "1D6A3" , -- \mttz
  }

math_map.sans = {
    ["0041"] = "1D5A0" , -- \msansA
    ["0042"] = "1D5A1" , -- \msansB
    ["0043"] = "1D5A2" , -- \msansC
    ["0044"] = "1D5A3" , -- \msansD
    ["0045"] = "1D5A4" , -- \msansE
    ["0046"] = "1D5A5" , -- \msansF
    ["0047"] = "1D5A6" , -- \msansG
    ["0048"] = "1D5A7" , -- \msansH
    ["0049"] = "1D5A8" , -- \msansI
    ["004A"] = "1D5A9" , -- \msansJ
    ["004B"] = "1D5AA" , -- \msansK
    ["004C"] = "1D5AB" , -- \msansL
    ["004D"] = "1D5AC" , -- \msansM
    ["004E"] = "1D5AD" , -- \msansN
    ["004F"] = "1D5AE" , -- \msansO
    ["0050"] = "1D5AF" , -- \msansP
    ["0051"] = "1D5B0" , -- \msansQ
    ["0052"] = "1D5B1" , -- \msansR
    ["0053"] = "1D5B2" , -- \msansS
    ["0054"] = "1D5B3" , -- \msansT
    ["0055"] = "1D5B4" , -- \msansU
    ["0056"] = "1D5B5" , -- \msansV
    ["0057"] = "1D5B6" , -- \msansW
    ["0058"] = "1D5B7" , -- \msansX
    ["0059"] = "1D5B8" , -- \msansY
    ["005A"] = "1D5B9" , -- \msansZ
    ["0061"] = "1D5BA" , -- \msansa
    ["0062"] = "1D5BB" , -- \msansb
    ["0063"] = "1D5BC" , -- \msansc
    ["0064"] = "1D5BD" , -- \msansd
    ["0065"] = "1D5BE" , -- \msanse
    ["0066"] = "1D5BF" , -- \msansf
    ["0067"] = "1D5C0" , -- \msansg
    ["0068"] = "1D5C1" , -- \msansh
    ["0069"] = "1D5C2" , -- \msansi
    ["006A"] = "1D5C3" , -- \msansj
    ["006B"] = "1D5C4" , -- \msansk
    ["006C"] = "1D5C5" , -- \msansl
    ["006D"] = "1D5C6" , -- \msansm
    ["006E"] = "1D5C7" , -- \msansn
    ["006F"] = "1D5C8" , -- \msanso
    ["0070"] = "1D5C9" , -- \msansp
    ["0071"] = "1D5CA" , -- \msansq
    ["0072"] = "1D5CB" , -- \msansr
    ["0073"] = "1D5CC" , -- \msanss
    ["0074"] = "1D5CD" , -- \msanst
    ["0075"] = "1D5CE" , -- \msansu
    ["0076"] = "1D5CF" , -- \msansv
    ["0077"] = "1D5D0" , -- \msansw
    ["0078"] = "1D5D1" , -- \msansx
    ["0079"] = "1D5D2" , -- \msansy
    ["007A"] = "1D5D3" , -- \msansz
  }

math_map.sansitalic = {
    ["0041"] = "1D608" , -- \mitsansA
    ["0042"] = "1D609" , -- \mitsansB
    ["0043"] = "1D60A" , -- \mitsansC
    ["0044"] = "1D60B" , -- \mitsansD
    ["0045"] = "1D60C" , -- \mitsansE
    ["0046"] = "1D60D" , -- \mitsansF
    ["0047"] = "1D60E" , -- \mitsansG
    ["0048"] = "1D60F" , -- \mitsansH
    ["0049"] = "1D610" , -- \mitsansI
    ["004A"] = "1D611" , -- \mitsansJ
    ["004B"] = "1D612" , -- \mitsansK
    ["004C"] = "1D613" , -- \mitsansL
    ["004D"] = "1D614" , -- \mitsansM
    ["004E"] = "1D615" , -- \mitsansN
    ["004F"] = "1D616" , -- \mitsansO
    ["0050"] = "1D617" , -- \mitsansP
    ["0051"] = "1D618" , -- \mitsansQ
    ["0052"] = "1D619" , -- \mitsansR
    ["0053"] = "1D61A" , -- \mitsansS
    ["0054"] = "1D61B" , -- \mitsansT
    ["0055"] = "1D61C" , -- \mitsansU
    ["0056"] = "1D61D" , -- \mitsansV
    ["0057"] = "1D61E" , -- \mitsansW
    ["0058"] = "1D61F" , -- \mitsansX
    ["0059"] = "1D620" , -- \mitsansY
    ["005A"] = "1D621" , -- \mitsansZ
    ["0061"] = "1D622" , -- \mitsansa
    ["0062"] = "1D623" , -- \mitsansb
    ["0063"] = "1D624" , -- \mitsansc
    ["0064"] = "1D625" , -- \mitsansd
    ["0065"] = "1D626" , -- \mitsanse
    ["0066"] = "1D627" , -- \mitsansf
    ["0067"] = "1D628" , -- \mitsansg
    ["0068"] = "1D629" , -- \mitsansh
    ["0069"] = "1D62A" , -- \mitsansi
    ["006A"] = "1D62B" , -- \mitsansj
    ["006B"] = "1D62C" , -- \mitsansk
    ["006C"] = "1D62D" , -- \mitsansl
    ["006D"] = "1D62E" , -- \mitsansm
    ["006E"] = "1D62F" , -- \mitsansn
    ["006F"] = "1D630" , -- \mitsanso
    ["0070"] = "1D631" , -- \mitsansp
    ["0071"] = "1D632" , -- \mitsansq
    ["0072"] = "1D633" , -- \mitsansr
    ["0073"] = "1D634" , -- \mitsanss
    ["0074"] = "1D635" , -- \mitsanst
    ["0075"] = "1D636" , -- \mitsansu
    ["0076"] = "1D637" , -- \mitsansv
    ["0077"] = "1D638" , -- \mitsansw
    ["0078"] = "1D639" , -- \mitsansx
    ["0079"] = "1D63A" , -- \mitsansy
    ["007A"] = "1D63B" , -- \mitsansz
  }

math_map.boldsans = {
    ["0041"] = "1D5D4" , -- \mbfsansA
    ["0042"] = "1D5D5" , -- \mbfsansB
    ["0043"] = "1D5D6" , -- \mbfsansC
    ["0044"] = "1D5D7" , -- \mbfsansD
    ["0045"] = "1D5D8" , -- \mbfsansE
    ["0046"] = "1D5D9" , -- \mbfsansF
    ["0047"] = "1D5DA" , -- \mbfsansG
    ["0048"] = "1D5DB" , -- \mbfsansH
    ["0049"] = "1D5DC" , -- \mbfsansI
    ["004A"] = "1D5DD" , -- \mbfsansJ
    ["004B"] = "1D5DE" , -- \mbfsansK
    ["004C"] = "1D5DF" , -- \mbfsansL
    ["004D"] = "1D5E0" , -- \mbfsansM
    ["004E"] = "1D5E1" , -- \mbfsansN
    ["004F"] = "1D5E2" , -- \mbfsansO
    ["0050"] = "1D5E3" , -- \mbfsansP
    ["0051"] = "1D5E4" , -- \mbfsansQ
    ["0052"] = "1D5E5" , -- \mbfsansR
    ["0053"] = "1D5E6" , -- \mbfsansS
    ["0054"] = "1D5E7" , -- \mbfsansT
    ["0055"] = "1D5E8" , -- \mbfsansU
    ["0056"] = "1D5E9" , -- \mbfsansV
    ["0057"] = "1D5EA" , -- \mbfsansW
    ["0058"] = "1D5EB" , -- \mbfsansX
    ["0059"] = "1D5EC" , -- \mbfsansY
    ["005A"] = "1D5ED" , -- \mbfsansZ
    ["0061"] = "1D5EE" , -- \mbfsansa
    ["0062"] = "1D5EF" , -- \mbfsansb
    ["0063"] = "1D5F0" , -- \mbfsansc
    ["0064"] = "1D5F1" , -- \mbfsansd
    ["0065"] = "1D5F2" , -- \mbfsanse
    ["0066"] = "1D5F3" , -- \mbfsansf
    ["0067"] = "1D5F4" , -- \mbfsansg
    ["0068"] = "1D5F5" , -- \mbfsansh
    ["0069"] = "1D5F6" , -- \mbfsansi
    ["006A"] = "1D5F7" , -- \mbfsansj
    ["006B"] = "1D5F8" , -- \mbfsansk
    ["006C"] = "1D5F9" , -- \mbfsansl
    ["006D"] = "1D5FA" , -- \mbfsansm
    ["006E"] = "1D5FB" , -- \mbfsansn
    ["006F"] = "1D5FC" , -- \mbfsanso
    ["0070"] = "1D5FD" , -- \mbfsansp
    ["0071"] = "1D5FE" , -- \mbfsansq
    ["0072"] = "1D5FF" , -- \mbfsansr
    ["0073"] = "1D600" , -- \mbfsanss
    ["0074"] = "1D601" , -- \mbfsanst
    ["0075"] = "1D602" , -- \mbfsansu
    ["0076"] = "1D603" , -- \mbfsansv
    ["0077"] = "1D604" , -- \mbfsansw
    ["0078"] = "1D605" , -- \mbfsansx
    ["0079"] = "1D606" , -- \mbfsansy
    ["007A"] = "1D607" , -- \mbfsansz
  }

math_map.boldsansitalic = {
    ["0041"] = "1D63C" , -- \mbfitsansA
    ["0042"] = "1D63D" , -- \mbfitsansB
    ["0043"] = "1D63E" , -- \mbfitsansC
    ["0044"] = "1D63F" , -- \mbfitsansD
    ["0045"] = "1D640" , -- \mbfitsansE
    ["0046"] = "1D641" , -- \mbfitsansF
    ["0047"] = "1D642" , -- \mbfitsansG
    ["0048"] = "1D643" , -- \mbfitsansH
    ["0049"] = "1D644" , -- \mbfitsansI
    ["004A"] = "1D645" , -- \mbfitsansJ
    ["004B"] = "1D646" , -- \mbfitsansK
    ["004C"] = "1D647" , -- \mbfitsansL
    ["004D"] = "1D648" , -- \mbfitsansM
    ["004E"] = "1D649" , -- \mbfitsansN
    ["004F"] = "1D64A" , -- \mbfitsansO
    ["0050"] = "1D64B" , -- \mbfitsansP
    ["0051"] = "1D64C" , -- \mbfitsansQ
    ["0052"] = "1D64D" , -- \mbfitsansR
    ["0053"] = "1D64E" , -- \mbfitsansS
    ["0054"] = "1D64F" , -- \mbfitsansT
    ["0055"] = "1D650" , -- \mbfitsansU
    ["0056"] = "1D651" , -- \mbfitsansV
    ["0057"] = "1D652" , -- \mbfitsansW
    ["0058"] = "1D653" , -- \mbfitsansX
    ["0059"] = "1D654" , -- \mbfitsansY
    ["005A"] = "1D655" , -- \mbfitsansZ
    ["0061"] = "1D656" , -- \mbfitsansa
    ["0062"] = "1D657" , -- \mbfitsansb
    ["0063"] = "1D658" , -- \mbfitsansc
    ["0064"] = "1D659" , -- \mbfitsansd
    ["0065"] = "1D65A" , -- \mbfitsanse
    ["0066"] = "1D65B" , -- \mbfitsansf
    ["0067"] = "1D65C" , -- \mbfitsansg
    ["0068"] = "1D65D" , -- \mbfitsansh
    ["0069"] = "1D65E" , -- \mbfitsansi
    ["006A"] = "1D65F" , -- \mbfitsansj
    ["006B"] = "1D660" , -- \mbfitsansk
    ["006C"] = "1D661" , -- \mbfitsansl
    ["006D"] = "1D662" , -- \mbfitsansm
    ["006E"] = "1D663" , -- \mbfitsansn
    ["006F"] = "1D664" , -- \mbfitsanso
    ["0070"] = "1D665" , -- \mbfitsansp
    ["0071"] = "1D666" , -- \mbfitsansq
    ["0072"] = "1D667" , -- \mbfitsansr
    ["0073"] = "1D668" , -- \mbfitsanss
    ["0074"] = "1D669" , -- \mbfitsanst
    ["0075"] = "1D66A" , -- \mbfitsansu
    ["0076"] = "1D66B" , -- \mbfitsansv
    ["0077"] = "1D66C" , -- \mbfitsansw
    ["0078"] = "1D66D" , -- \mbfitsansx
    ["0079"] = "1D66E" , -- \mbfitsansy
    ["007A"] = "1D66F" , -- \mbfitsansz
}

--[[

# Write the tables to file in appropriate ways

Three files needed:

1. The Lua table mapping numeric glyph slots to glyph slots for each math alphabet.
   Basically a slimmed down `serialise`.

2. The XeTeX font mapping files.

3. For convenience, a shell script for compiling the XeTeX font mapping files so XeTeX can read them.

--]]

local f = assert(io.open("umath-alphabet-mappings.lua", "w"))
f:write("-- this file is automatically generated; do not edit","\n\n")
f:write("math_maps = {","\n")
for kk,vv in pairs(math_map) do
  f:write("  [\"",kk,"\"] = {","\n")
  for k,v in pairs(vv) do
    slot = math_sym_names[k] or k
    val  = math_sym_names[v] or v
    f:write("    [0x",slot,"] = 0x",val," ,","\n")
  end
  f:write("  },","\n")
end
f:write('}','\n')
f:close()

teckit_prefix = "mapping_math_"
for kk,vv in pairs(math_map) do
  local f = assert(io.open(teckit_prefix..kk..".map", "w"))
  f:write("LHSName \"ascii\"","\n","RHSName \"","unicode-maths-",kk,"\"","\n","pass(Unicode)","\n\n")
  for k,v in pairs(vv) do
    slot = math_sym_names[k] or k
    val  = math_sym_names[v] or v
    f:write("U+",slot," <> U+",val," ;\n")
  end
  f:close()
end

local f = assert(io.open("teckit_compile_mappings.sh", "w"))
f:write("#!/bin/sh","\n\n")
for kk,vv in pairs(math_map) do
  f:write("teckit_compile ",teckit_prefix,kk,"\n")
end
f:close()
