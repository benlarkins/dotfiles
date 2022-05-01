{-
__/\\\_______/\\\__/\\\\____________/\\\\____________________________________________________/\\\__
 _\///\\\___/\\\/__\/\\\\\\________/\\\\\\___________________________________________________\/\\\__
  ___\///\\\\\\/____\/\\\//\\\____/\\\//\\\___________________________________________________\/\\\__
   _____\//\\\\______\/\\\\///\\\/\\\/_\/\\\_____/\\\\\_____/\\/\\\\\\____/\\\\\\\\\___________\/\\\__
    ______\/\\\\______\/\\\__\///\\\/___\/\\\___/\\\///\\\__\/\\\////\\\__\////////\\\_____/\\\\\\\\\__
     ______/\\\\\\_____\/\\\____\///_____\/\\\__/\\\__\//\\\_\/\\\__\//\\\___/\\\\\\\\\\___/\\\////\\\__
      ____/\\\////\\\___\/\\\_____________\/\\\_\//\\\__/\\\__\/\\\___\/\\\__/\\\/////\\\__\/\\\__\/\\\__
       __/\\\/___\///\\\_\/\\\_____________\/\\\__\///\\\\\/___\/\\\___\/\\\_\//\\\\\\\\/\\_\//\\\\\\\/\\_
        _\///_______\///__\///______________\///_____\/////_____\///____\///___\////////\//___\///////\//__
-}

import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- HOOKS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (isFullscreen, doCenterFloat, doFullFloat)

-- LAYOUT
import XMonad.Layout.Spacing

-- UTIL
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

-- APP PREFERENCES
myTerminal          = "alacritty"
myBrowser           = "brave"
myFocusFollowsMouse = True
myModMask           = mod4Mask
myWorkspaces        = ["1 ","2 ","3 ","4 ","5 "]

-- BORDER SETTINGS
myBorderWidth        = 2
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#b14350"

-- COLORS
blue     = "#6A7EC8"
dimWhite = "#c9d1d9"
green    = "#86B42B"
red      = "#b14350"
yellow   = "#B3B42B"

-- KEY BINDINGS
myKeys :: [(String, X ())]
myKeys =
        [("M-S-r",       spawn "xmonad --recompile; xmonad --restart")
        ,("C-q",         kill)
        ,("M-S-q",       io exitSuccess)
        ,("M-<Space>",   sendMessage NextLayout)
        -- ,("M-S-<Space>", setLayout $ XMonad.layoutHook conf)
        ,("M-n",         refresh)

        -- NAVIGATE WINDOWS
        ,("M-l",         windows W.focusDown)
        ,("M-j",         windows W.focusDown)
        ,("M-k",         windows W.focusUp)
        ,("M-h",         windows W.focusMaster)
        ,("M-S-h",       windows W.swapMaster)
        ,("M-S-l",       windows W.swapDown)
        ,("M-S-j",       windows W.swapDown)
        ,("M-S-k",       windows W.swapUp)
        ,("M-C-h",       sendMessage Shrink)
        ,("M-C-l",       sendMessage Expand)
        ,("M-t",         withFocused $ windows . W.sink)
        ,("M-,",         sendMessage (IncMasterN 1))
        ,("M-.",         sendMessage (IncMasterN (-1)))

        -- LAUNCH APPS
        ,("M-x",         spawn "arcolinux-logout")
        ,("M-w",         spawn "brave")
        ,("C-S-4",       spawn "gnome-screenshot -i")
        ,("C-S-5",       spawn "kooha")
        ,("C-<Space>",   spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
        ,("M-<Return>",  spawn myTerminal)
        -- ,("M-t",         spawn myTerminal)

        -- AUDIO CONTROLS
        ,("<XF86AudioPlay>",              spawn "playerctl play-pause")
        ,("<XF86AudioNext>",              spawn "playerctl next")
        ,("<XF86AudioPrev>",              spawn "playerctl previous")
        ,("<XF86AudioStop>",              spawn "playerctl stop")
        ,("<XF86AudioMute>",              spawn "amixer -D pulse set Master 1+ toggle")
        ,("<XF86AudioRaiseVolume>",       spawn "amixer set Master 5%+")
        ,("<XF86AudioLowerVolume>",       spawn "amixer set Master 5%-")]


-- MOUSE BINDINGS
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                      >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                      >> windows W.shiftMaster)

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- LAYOUTS
mySpacing i =   spacingRaw False
                (Border i i i i)
                True
                (Border i i i i)
                True

myLayoutHook = avoidStruts myLayout
myLayout = mySpacing 10 $ tiled ||| Mirror tiled ||| Full
            where
                -- default tiling algorithm partitions the screen into two panes
                tiled   = mySpacing 15 $ Tall nmaster delta ratio

                -- The default number of windows in the master pane
                nmaster = 1

                -- Default proportion of screen occupied by master pane
                ratio   = 1/2

                -- Percent of screen to increment by when resizing panes
                delta   = 3/100

-- WINDOW RULES
myManageHook = composeAllFocusFloats
    [ className =? "MPlayer"
    , className =? "confirm"
    , className =? "file_progress"
    , className =? "dialog"
    , className =? "download"
    , className =? "error"
    , className =? "notification"
    , className =? "Xdg-desktop-portal-gtk"
    , className =? "Gimp" ]
    <+> composeAllCenterFloats
    [ className =? "kooha" ]
    <+> composeAll
    [ className =? "nuclear"                --> doShift "5"
    , resource  =? "desktop_window"         --> doIgnore
    , resource  =? "kdesktop"               --> doIgnore
    , isFullscreen                          --> doFocusFullFloat ]
-- Add new window below the focused window and focus the new window
    <+> composeAll
    [ insertPosition Below Newer ]
  where
    composeAllCenterFloats = composeAll . map (--> doFocusCenterFloat)
    composeAllFocusFloats = composeAll . map (--> doFocusFloat)
    doFocusFloat = composeAll [doFloat, insertPosition Above Newer]
    doFocusCenterFloat = composeAll [doCenterFloat, insertPosition Above Newer]
    doFocusFullFloat = composeAll [doFullFloat, insertPosition Above Newer]

-- Event handling
myEventHook = mempty

-- mapToCustomName "1" = "1"
-- mapToCustomName "2" = "2"
-- mapToCustomName "3" = "3"
-- mapToCustomName "4" = "4"
-- mapToCustomName "5" = "5"
mapToCustomName x = x

-- Status bars and logging
myPPCurrent         = xmobarColor "white" ""
myPPHiddenNoWindows = xmobarColor dimWhite ""
myPPHidden          = mapToCustomName
myPPOrder           = \(ws:_:t:_) -> [ws,t]

myLogHook h = dynamicLogWithPP $ xmobarPP
                { ppCurrent         = myPPCurrent
                , ppHidden          = myPPHidden
                , ppHiddenNoWindows = myPPHiddenNoWindows
                , ppOrder           = myPPOrder
                , ppOutput          = hPutStrLn h
                , ppSep             = " | "
                , ppTitle           = xmobarColor "white" "" . shorten 60 . pad }

-- START UP
myStartupHook = do
        spawnOnce "nitrogen --restore &"
        spawnOnce "xautolock -time 60 -locker \"systemctl suspend\" &"
        spawnOnce "setxkbmap -option terminate:ctrl_alt_bksp,ctrl:swap_lalt_lctl_lwin,caps:escape &"
        spawnOnce "picom --config $HOME/.config/picom/picom.conf &"
        spawn ("sleep 2 && trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 36 --tint 0x272822 --height 30")


-- RUN XMONAD MAIN
main = do
        h <- spawnPipe "xmobar"
        xmonad $ docks $ myConfig h

myConfig h = def {
                terminal           = myTerminal,
                focusFollowsMouse  = myFocusFollowsMouse,
                borderWidth        = myBorderWidth,
                modMask            = myModMask,
                workspaces         = myWorkspaces,
                normalBorderColor  = myNormalBorderColor,
                focusedBorderColor = red,
                mouseBindings      = myMouseBindings,
                layoutHook         = myLayoutHook,
                manageHook         = myManageHook,
                handleEventHook    = myEventHook,
                logHook            = myLogHook h,
                startupHook        = myStartupHook
        } `additionalKeysP` myKeys
