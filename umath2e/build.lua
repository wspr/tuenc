#!/usr/bin/env texlua

-- Identify the module
module = "umath2e"

unpackfiles = {"math-map-gen.lua"}

bundleunpack = bundleunpack or function(sourcedir)
  local errorlevel = mkdir(localdir)
  if errorlevel ~=0 then
    return errorlevel
  end
  errorlevel = cleandir(unpackdir)
  if errorlevel ~=0 then
    return errorlevel
  end
  for _,i in ipairs(sourcedir or {"."}) do
    for _,j in ipairs(sourcefiles) do
      errorlevel = cp(j, i, unpackdir)
      if errorlevel ~=0 then
        return errorlevel
      end
    end
  end
  for _,i in ipairs(unpacksuppfiles) do
    errorlevel = cp(i, supportdir, localdir)
    if errorlevel ~=0 then
      return errorlevel
    end
  end
  errorlevel = unpackfunc(localdir,unpackdir)
  if errorlevel ~=0 then
    return errorlevel
  end
  return 0
end

function unpackfunc(localdir,unpackdir)

  local localdir = relpath(localdir, unpackdir)

  print("Generating XeTeX and LuaTeX mapping files...")
  print(unpackdir)
  errorlevel = run(unpackdir,"texlua math-map-gen.lua")
  if errorlevel ~=0 then return errorlevel end


  print("Generating unicode symbol definitions...")
  errorlevel = run(unpackdir,"lualatex syms-2e.tex")
  if errorlevel ~=0 then return errorlevel end

  return 0
end

-- Release a TDS-style zip
packtdszip  = true

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))

