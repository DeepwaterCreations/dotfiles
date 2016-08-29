import XMonad
--import XMonad.Config.Desktop
--import XMonad.Wallpaper
import XMonad.Hooks.DynamicLog
--import XMonad.Hooks.ManageDocks
--import Xmonad.Util.Run(spawnPipe)
--import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = xmonad =<< statusBar bar pp toggleStrutsKey thisConfig 

--randWallpaper = do setRandomWallpaper ["$HOME/wallpaper"]

bar = "xmobar"

pp = xmobarPP { ppCurrent = xmobarColor "#0171ac" "" . wrap "<" ">" }

--Key binding to toggle the gap for the bar...?
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

--Main configuration 
thisConfig = defaultConfig{
            modMask = mod4Mask --Mod key to Windows key instead of alt
            , terminal = "urxvt"
--	, manageHook = manageDocks <+> manageHook defaultConfig
--	, layoutHook = avoidStruts $ layoutHook defaultConfig
            }
