{-# OPTIONS_GHC -Wno-deprecations #-}

-- Base
import XMonad
import System.Directory
import XMonad.Actions.SpawnOn
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W
import Control.Concurrent

-- Hooks
import XMonad.Hooks.EwmhDesktops ( ewmh )
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat, doCenterFloat)
import XMonad.Hooks.ManageDocks ( avoidStruts, docks,docksEventHook, manageDocks, Direction2D(D, L, R, U), ToggleStruts(..) )
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ServerMode
import XMonad.Hooks.WindowSwallowing
import XMonad.Hooks.WindowSwallowing
-- Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust, maybeToList)
import Data.Monoid
import Data.Maybe (isJust)
import qualified Data.Map as M
import Control.Monad ( join, when )

-- Layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing ( spacingRaw, Border(Border) )
import XMonad.Layout.Gaps ( Direction2D(D, L, R, U), gaps, setGaps,GapMessage(DecGap, ToggleGaps, IncGap))
import XMonad.Layout.Fullscreen ( fullscreenEventHook, fullscreenManageHook, fullscreenSupport, fullscreenFull )

-- Utilities
import XMonad.Util.SpawnOnce ( spawnOnce )
import XMonad.Util.EZConfig (additionalKeysP)


myLogHook = return ()

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myBorderWidth :: Dimension
myBorderWidth =  1          -- Sets border width for windows

myNormColor :: String       -- Border color of normal windows
myNormColor   = "#1a1b26"

myFocusColor :: String      -- Border color of focused windows
myFocusColor  = "#a9b1d6"

myTerminal :: String
myTerminal = "alacritty "    -- Sets default terminal

myBrowser :: String
myBrowser = "firefox"    -- Sets default browser

myPrivetBrowser :: String
myPrivetBrowser = "tor-browser"    -- Sets default browser

myEditor :: String
myEditor  = "emacsclient -c -a 'emacs'"

myFileManager :: String
myFileManager = "nemo"

myTerminalFileManager :: String
myTerminalFileManager =  myTerminal ++ " -e lf "

myMailClinet :: String
myMailClinet =  "mailspring"

myChatClinet :: String
myChatClinet  = "discord"

myMusic :: String
myMusic = "spotify"

myGameLauncher  :: String
myGameLauncher  = "steam"

myCMDLauncher :: String
myCMDLauncher = "dmenu_run"

mySystemBuilder :: String
mySystemBuilder = "/home/haam/.xmonad/scripts/nixos-compil.sh"

myLauncher :: String
myLauncher = "j4-dmenu-desktop --dmenu='dmenu'"

myClipBoard :: String
myClipBoard = "clipmenu"

myWorkspaces    = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

addNETSupported :: Atom -> X ()
addNETSupported x   = withDisplay $ \dpy -> do
    r               <- asks theRoot
    a_NET_SUPPORTED <- getAtom "_NET_SUPPORTED"
    a               <- getAtom "ATOM"
    liftIO $ do
       sup <- (join . maybeToList) <$> getWindowProperty32 dpy a_NET_SUPPORTED r
       when (fromIntegral x `notElem` sup) $
         changeProperty32 dpy r a_NET_SUPPORTED a propModeAppend [fromIntegral x]

addEWMHFullscreen :: X ()
addEWMHFullscreen   = do
    wms <- getAtom "_NET_WM_STATE"
    wfs <- getAtom "_NET_WM_STATE_FULLSCREEN"
    mapM_ addNETSupported [wms, wfs]

myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100



myKeys :: [(String, X ())]
myKeys =
        [ ("M-t",                       spawn myTerminal )
        , ("M-f",                       spawn myFileManager)
        , ("M-S-f",                     spawn myTerminalFileManager )
        , ("M-e",                       spawn myEditor)
        , ("M-b",                       spawn myBrowser)
        , ("M-S-b",                     spawn myPrivetBrowser)
        , ("M-d",                       spawn myLauncher )
        , ("M-S-u",                     spawn mySystemBuilder)
        , ("M-p",                       spawn myCMDLauncher )
        , ("M-S-d",                     spawn myClipBoard )
        , ("M-m",                       spawn myMailClinet)
        , ("M-c",                       spawn myChatClinet )
        , ("M-s",                       spawn myMusic)
        , ("M-S-s",                     spawn myGameLauncher )
        , ("M-v",                       spawn "virt-manager" )
        , ("<XF86AudioPlay>",           spawn "playerctl play-pause")
        , ("<XF86AudioPrev>",           spawn "playerctl previous")
        , ("<XF86AudioNext>",           spawn "playerctl next")
        , ("<XF86AudioMute>",           spawn "amixer -q -D sset Master toggle")
        , ("<XF86AudioRaiseVolume>",    spawn "amixer -q -D sset Master 1%+")
        , ("<XF86AudioLowerVolume>",    spawn "amixer -q -D sset Master 1%-")
        , ("<XF86MonBrightnessUp>",     spawn "brightnessctl s +1%")
        , ("<XF86MonBrightnessDown>",   spawn "brightnessctl s 1-%")
        , ("M-q",                       kill)
        , ("M-<Space>",                 sendMessage NextLayout)
        , ("M-n",                       withFocused $ windows . W.sink)
        , ("M-<Tab>",                   windows W.focusDown)
        , ("M-S-j",                     windows W.swapDown)
        , ("M-S-k",                     windows W.swapUp)
        , ("M-<Return>",                windows W.swapMaster)
        , ("M-h",                       sendMessage Shrink)
        , ("M-l",                       sendMessage Expand)
        , ("M-,",                       sendMessage (IncMasterN 1))
        , ("M-.",                       sendMessage (IncMasterN (-1)))
        , ("M-S-r",                     spawn "xmonad --recompile;xmonad --restart")
        , ("M-M1-r",                    io exitSuccess)
        ]


myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = fullscreenManageHook <+> manageDocks <+> composeAll
     [ className =? "confirm"         --> doFloat
     , className =? "file_progress"   --> doFloat
     , className =? "dialog"          --> doFloat
     , className =? "download"        --> doFloat
     , className =? "error"           --> doFloat
     , className =? "Gimp"            --> doFloat
     , className =? "notification"    --> doFloat
     , className =? "pinentry-gtk-2"  --> doFloat
     , className =? "splash"          --> doFloat
     , className =? "toolbar"         --> doFloat
     , className =? "Yad"             --> doCenterFloat
     , isFullscreen -->  doFullFloat
     ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "dunst"
  spawnOnce "picom --experimental-backends"
  spawnOnce "feh --bg-scale ~/.config/wallpaper/0.png"
  spawnOnce "emacs --daemon"
--  spawnOnce "eww --daemon"
--  spawnOnce "eww open bar"
  spawnOnce "polybar"
  spawnOnce "clipmenud"
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "setxkbmap -model pc104 -layout us,ar -option grp:alt_shift_toggle"

main = xmonad $ fullscreenSupport $ docks $ ewmh defaults
defaults = def {
         manageHook         = myManageHook <+> manageDocks
        , handleEventHook    = swallowEventHook (className =? "Alacritty" <||> className =? "Termite") (return True)
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook >> addEWMHFullscreen
        , layoutHook         = gaps [(L,2), (R,2), (U,37), (D,2)] $ spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True $ smartBorders $ myLayout
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormColor
        , focusedBorderColor = myFocusColor
        , logHook = myLogHook
        } `additionalKeysP` myKeys
