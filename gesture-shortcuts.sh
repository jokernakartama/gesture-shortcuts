#!/bin/bash

isscreenlocked=$(qdbus org.freedesktop.ScreenSaver /ScreenSaver org.freedesktop.ScreenSaver.GetActive)

while [ -n "$1" ]
do
    case "$1" in
        test)
            if [ "$isscreenlocked" == 'false' ]
            then
                echo "Not locked"
            fi
            ;;
        exposeall) 
            if [ "$isscreenlocked" != 'true' ];
            then
                # Show all open windows of all desktops
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "ExposeAll"
            fi
            ;;
        expose) 
            if [ "$isscreenlocked" != 'true' ]
            then
                # Show all open windows of the current desktop
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Expose"
            fi
            ;;
        nextdesktop)
            if [ "$isscreenlocked" != 'true' ]
            then
                # Switch to the next desktop
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Switch to Next Desktop"
                # It's better to use kglobalaccel shortcuts, to be able turn on/off circle switching option via UI
                # qdbus org.kde.KWin /KWin org.kde.KWin.nextDesktop

            fi
            ;;
        previousdesktop) 
            if [ "$isscreenlocked" != 'true' ]
            then
                # Switch to the previous desktop
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Switch to Previous Desktop"
            fi
            ;;
            
        zoomin) 
            if [ "$isscreenlocked" != 'true' ]
            then
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "view_zoom_in"
            fi
            ;;
            
        zoomout) 
            if [ "$isscreenlocked" != 'true' ]
            then
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "view_zoom_out"
            fi
            ;;
            
        desktopgrid) 
            if [ "$isscreenlocked" != 'true' ]
            then
                # Show all desktops
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "ShowDesktopGrid"
            fi
            ;;
            
        desktopshow) 
            if [ "$isscreenlocked" != 'true' ]
            then
                # Show the current desktop
                qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Show Desktop"
            fi
            ;;
    esac
    shift
done

