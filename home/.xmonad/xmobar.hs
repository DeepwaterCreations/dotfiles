Config {
 -- -- appearance
 --     font =         "xft:Bitstream Vera Sans Mono:size=9:bold:antialias=true"
 --   , bgColor =      "black"
 --   , fgColor =      "#646464"
    -- position =     Bottom
 --   , border =       BottomB
 --   , borderColor =  "#646464"

 --   -- layout
    sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
 -- , template = "%battery% | %multicpu% | %coretemp% | %memory% | %dynnetwork% }{ %RJTT% | %date% || %kbd% "
    , template = "%cmus% | %mpris2% }{ %date%"

 --   -- general behavior
 --   , lowerOnStart =     True    -- send to bottom of window stack on start
 --   , hideOnStart =      False   -- start with window unmapped (hidden)
 --   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
 --   , pickBroadest =     False   -- choose widest display (multi-monitor)
 --   , persistent =       True    -- enable/disable hiding (True = disabled)

    -- , commands =
    --     [Run Mpris2 "cmus" [] 10]
}
