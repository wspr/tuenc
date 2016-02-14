#!/usr/bin/env texlua

-- Identify the module
module = "umath2e"
print("Build script for "..module)

sourcefiles = {"*.dtx","*.ins","*.lua"}
unpackfiles = {"*.ins"}
installfiles = {"*.lua","*.sty"}
unpackexe = "luatex"

-- Split off from the main unpack so it can be used on a bundle and not
-- leave only one modules files
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
  for _,i in ipairs(unpackfiles) do
    for _,j in ipairs(filelist(unpackdir, i)) do
      print("Unpacking "..j)
      errorlevel = unpackfunc(j)
      if errorlevel ~=0 then
        return errorlevel
      end
    end
  end
  return 0
end

function unpackfunc(j)
  local localdir = relpath(localdir, unpackdir)
  local runcmd = os_setenv .. " TEXINPUTS=." .. os_pathsep
      .. localdir .. (unpacksearch and os_pathsep or "") ..
    os_concat ..
    unpackexe .. " " .. unpackopts .. " " .. j .. (optquiet and (" > " .. os_null) or "")
  errorlevel = run( unpackdir, runcmd  )
  return errorlevel
end

-- Release a TDS-style zip
packtdszip  = true

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))

