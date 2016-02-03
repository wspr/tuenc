
italic_map = {
["0061"] = "1D44E" , -- \mita
["0062"] = "1D44F" , -- \mitb
["0063"] = "1D450" , -- \mitc
["0064"] = "1D451" , -- \mitd
["0065"] = "1D452" , -- \mite
["0066"] = "1D453" , -- \mitf
["0067"] = "1D454" , -- \mitg
["0068"] = "0210E" , -- \mith
["0069"] = "1D456" , -- \miti
["006A"] = "1D457" , -- \mitj
["006B"] = "1D458" , -- \mitk
["006C"] = "1D459" , -- \mitl
["006D"] = "1D45A" , -- \mitm
["006E"] = "1D45B" , -- \mitn
["006F"] = "1D45C" , -- \mito
["0070"] = "1D45D" , -- \mitp
["0071"] = "1D45E" , -- \mitq
["0072"] = "1D45F" , -- \mitr
["0073"] = "1D460" , -- \mits
["0074"] = "1D461" , -- \mitt
["0075"] = "1D462" , -- \mitu
["0076"] = "1D463" , -- \mitv
["0077"] = "1D464" , -- \mitw
["0078"] = "1D465" , -- \mitx
["0079"] = "1D466" , -- \mity
["007A"] = "1D467" , -- \mitz
["0041"] = "1D434" , -- \mitA
["0042"] = "1D435" , -- \mitB
["0043"] = "1D436" , -- \mitC
["0044"] = "1D437" , -- \mitD
["0045"] = "1D438" , -- \mitE
["0046"] = "1D439" , -- \mitF
["0047"] = "1D43A" , -- \mitG
["0048"] = "1D43B" , -- \mitH
["0049"] = "1D43C" , -- \mitI
["004A"] = "1D43D" , -- \mitJ
["004B"] = "1D43E" , -- \mitK
["004C"] = "1D43F" , -- \mitL
["004D"] = "1D440" , -- \mitM
["004E"] = "1D441" , -- \mitN
["004F"] = "1D442" , -- \mitO
["0050"] = "1D443" , -- \mitP
["0051"] = "1D444" , -- \mitQ
["0052"] = "1D445" , -- \mitR
["0053"] = "1D446" , -- \mitS
["0054"] = "1D447" , -- \mitT
["0055"] = "1D448" , -- \mitU
["0056"] = "1D449" , -- \mitV
["0057"] = "1D44A" , -- \mitW
["0058"] = "1D44B" , -- \mitX
["0059"] = "1D44C" , -- \mitY
["005A"] = "1D44D" , -- \mitZ
}


local f = assert(io.open("math-italic-gen.fea", "w"))

f:write("languagesystem LATN dflt;","\n")
f:write("feature gsub {","\n")
for i,v in pairs(italic_map) do
  f:write("  sub U+",i," by U+",v,";\n")
end
f:write("} gsub;","\n")
f:close()



local f = assert(io.open("math-italic-gen.map", "w"))
f:write("LHSName \"ascii\"","\n","RHSName \"unicode-italic-maths\"","\n","pass(Unicode)","\n")
for i,v in pairs(italic_map) do
  f:write("  U+",i," <> U+",v," ;\n")
end
f:close()


