import XMonad
--import XMonad.Config.Desktop
--import XMonad.Wallpaper
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
--import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.EwmhDesktops --For streaming via OBS

import System.IO

main = do
    -- xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    -- xmproc <- spawnPipe "xmobar"
    -- xmonad =<< statusBar bar pp toggleStrutsKey thisConfig
    -- xmonad $ ewmh $ thisConfig xmproc
    -- xmonad =<< xmobar ( ewmh ( thisConfig ) )
    config <- statusBar bar pp toggleStrutsKey (ewmh thisConfig)
    xmonad config


--randWallpaper = do setRandomWallpaper ["$HOME/wallpaper"]

-- bar = "xmobar ~/.xmonad/xmobar.hs"
bar = "xmobar"

pp = xmobarPP { ppCurrent = xmobarColor "#0171ac" "" . wrap "<" ">" }

--Key binding to toggle the gap for the bar...?
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

--Main configuration 
-- thisConfig xmproc = defaultConfig{
thisConfig = defaultConfig{
      modMask = mod4Mask --Mod key to Windows key instead of alt
    , terminal = "urxvt"
    -- , logHook = thisLogHook xmproc
    , logHook = dynamicLogString xmobarPP >>= xmonadPropLog
    -- , startupHook = thisStartupHook
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    }

-- thisLogHook :: Handle -> X ()
-- thisLogHook h = do
--     dynamicLogWithPP $ xmobarPP { ppCurrent = xmobarColor "#0171ac" "" . wrap "<" ">" }

-- thisStartupHook h = return ()
