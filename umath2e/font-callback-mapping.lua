
-- require('serialise')
require('math-map-gen.lua')
require('umath-alphabet-mappings.lua')

orig_define_font=luatexbase.remove_from_callback('define_font','luaotfload.define_font')

function x_define_font(name,size,id)
  local thisfont=orig_define_font(name,size,id)
  this_mapping = math_maps[mathmapstr]
  if (this_mapping and type(thisfont)=='table') then
--[-[ # this is what's in the font:
      io.write('\n\n')
      for k,v in pairs(thisfont) do
        if type(v) == 'table' then
          local count = 0
          for _ in pairs(v) do count = count + 1 end
          io.write(k,' (( table, length ',count,'))\n')
        else
          print(k,' = "',v,'"',' (',type(v),')')
        end
      end io.write('\n\n')  ERROR()
--]]
    for k,v in pairs(this_mapping) do
	    thisfont.characters[k]=subst_glyph(thisfont,v)
	  end
  end
  return thisfont
end

function subst_glyph(font,slot)
  if not( font.characters[slot] ) then  return nil  end

  local char={}
  local entries = {"width","top_accent","italic","height","depth"}

  -- if slot > 0x10000 then  serialise(font.characters[slot]) ERROR()  end
  for i,v in pairs(entries) do
    char[v] = font.characters[slot][v]
  end
  char.commands   = {{'char',slot}}
  return char
end

luatexbase.add_to_callback('define_font',x_define_font,'my_define_font')
