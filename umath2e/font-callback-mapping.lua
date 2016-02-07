
require('math-map-gen.lua')
require('mapping-math.lua')

orig_define_font=luatexbase.remove_from_callback('define_font','luaotfload.define_font')

function x_define_font(name,size,id)
  local thisfont=orig_define_font(name,size,id)
  this_mapping = math_maps[mathmapstr]
  if (this_mapping and type(thisfont)=='table') then
--    for k,v in pairs(thisfont) do
--      print(k)
--    end
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

  -- serialise(font.characters[slot]) ERROR()
  for i,v in pairs(entries) do
    char[v] = font.characters[slot][v]
  end
  char.commands   = {{'char',slot}}
  return char
end

luatexbase.add_to_callback('define_font',x_define_font,'my_define_font')
