# The "UC" LaTeX font encoding

This work is tentative, with aims to merge into LaTeX2e after the TL2016 release.
This document describes the features of this somewhat unusual encoding, and is intended to initial discussions on what unicode font encodings are all about, really.


## Why a unicode font encoding?

LaTeX defines a set of accents and symbols via control sequences that need to be mapped correctly.
In 8-bit TeX, font encodings are necessary to "connect" input characters with glyphs, whereas in Unicode TeX variants Unicode characters can be passed straight through to the font.


## The advantage of the 8-bit approach

A Unicode font can contain any set of glyphs, and there is no guarantee that various symbols or accented letters will be available.
In Unicode TeX we could define "Unicode subsets" according to the needs of the document.
If a font is selected that does not conform to the subset, substitute definitions could be defined.

## Package description

This package defines both ideas above as the starting point to discuss whether the extended approach is sensible.

### tuenc.def

The main Unicode font encoding file. Unlike traditional "enc.def" files, this file only contains macro definitions for setting up arbitrary Unicode font encodings.
If this package is incorporated into LaTeX2e, these definitions could migrate into the kernel.

### Definitions for .fd files

XeTeX and LuaTeX (via luaotfload) have different syntaxes for loading OpenType fonts.
The Unicode encoding defines `\UnicodeFontFile` and `\UnicodeFontTeXLigatures` as generic wrapper macros; e.g.:

    \DeclareFontShape{UC}{lmr}{b}{n}
     {<-> \UnicodeFontFile{lmromandemi10-regular}{\UnicodeFontTeXLigatures}}{}

Although not used in the default .fd files, `\UnicodeFontName` is also defined to load a system font by its OpenType name.

### Wrappers for Unicode encoding definitions

To save a redundant argument and provide a consistent set of commands, the encoding defines the following:

    \add@unicode@accent#1#2{#2\char#1\relax}
    \DeclareUnicodeCommand#1#2
    \DeclareUnicodeAccent#1#2
    \DeclareUnicodeSymbol#1#2
    \DeclareUnicodeComposite#1#2#3
    \DeclareUnicodeCompositeCommand#1#2#3

I.e., the encoding definitions look like:

    \DeclareUnicodeSymbol{\texttrademark}{"2122}


### Subsets and defining encodings

Instead of encoding definitions included in the `enc.def` file, "subsets" are defined with current naming scheme `ufontsub-XYZ.def` where `XYZ` is the name of the subset.

The "default" Unicode encoding, `UC` covers `T1` and `TS1` symbols, and is defined with:

    \DeclareEncodingFromSubsets{UC}{T1,TS1}{}

The third argument is used for package authors who need to make small adjustments on a per-font basis, for example:

    \DeclareEncodingFromSubsets{TZ1}{T1,TS1}{%
        \DeclareUnicodeCommand{\ae}{a\kern-0.2em\relax e}%
    }

Additional `\UndeclareXYZ` commands may need to be defined to aid here.

The latest version of fontspec allows fonts to be loaded with varying encodings, although I predict a fairly painful outcome from trying to load `\rmfamily` and `sffamily` with different encodings.


### Active characters

Every Unicode character defined in an encoding subset could be made "active" and hooked into LICR machinery as in 8-bit fonts.
However, the LaTeX3 team follows Unicode regarding catcode assignment, and all letter-like glyphs are able to be used in control sequences in Unicode TeX engines.

As a result, at present there will be no provision for run-time manipulation of arbitrary Unicode input.

*****

In a hypothetical future, we might imagine providing hooks to transform Unicode input into LICR-style input.
The advantage would be that we could now give good error messages if the wrong font is used; e.g., writing

    \DeclareEncodingFromSubsets{X1}{T1,TS1}{%
       \DeclareUnicodeSymbol{\textDelta}{"0394}%
    }

and then using the Unicode input character in the wrong encoding would yield

    LaTeX Error: Command \textDelta unavailable in encoding UC

Support here needs to be improved. If a user writes

    \DeclareUnicodeCommand{\ae}{a\kern-0.2em\relax e}%

there's no way to hook that definition into the Unicode input character "æ" unless it's already been defined via `\DeclareUnicodeSymbol`.
So if we adopt the active character approach the encoding subsets will need to be defined differently.

I also like the concept of making various symbols active so that they can be hooked into — e.g., could imagine making ‘—’ active and adding more intelligent line-breaking macros into its definition.


### The only thing we can't catch

Even if we went via the active-character approach discussed above, there would be no direct method by which we could catch users who write letters with composing accents directly in Unicode such as "A̲" (A+underbar, which has no precomposed Unicode glyph). If the font does not produce a good result, there only thing to do is fall back on traditional TeX input such as `\b A`.


### Checking font support

We can also query whether a given font supports a font subset:

    \CheckFontSupportsSubsets\font{T1,TS1}

This is surprisingly (?) fast.


# Do we need all of this?

To date, no-one has really complained about the current behaviour in XeTeX/LuaTeX that they type Unicode glyphs directly which are passed through to the font -- if the glyph does not exist in the font, you just have to choose another font.

But with more explicit, optional, support for Unicode subsets in LaTeX, users who have sophisticated needs could now write quite specific encodings for their documents, and dynamically ensure that switching fonts, etc., will yield correct results. In addition, users who need to customise, for example, a particular accent placement, now have methods to do so.


# Summary of decisions to make:

* Naming of `\UnicodeFontFile` / `\UnicodeFontName`
* Naming of `\UnicodeFontTeXLigatures`
* Naming of `\DeclareUnicodeXYZ` (and cf utf8enc.dfu!)
* The idea of Unicode subsets
