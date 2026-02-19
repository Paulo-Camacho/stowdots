# system links
inside the stowdots mimic structure of the local system(stowdots/.config/<nameOfprogram>)
    from here gnu <nameOfprogram>, this will generate appriopriate files


# applications
  alias fast='fastfetch -c ~/.config/fastfetch/temp.jsonc -l arch'

  picom
    this makes the system feel so much nicer to use


* tips
  - You could delete the local .config file and restore from github using stow without having to make 
    the dir or file on the local system.

# xinput
  this is to adjust the tracking speed of the cursor
    bit@slayer:~/stowdots$ xinput list
  ⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
  ⎜   ↳ PIXA3854:00 093A:0274 Touchpad          	id=11	[slave  pointer  (2)]
  ⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
      ....

        /etc/X11/xorg.conf.d/30-touchpad.conf
            Section "InputClass"
            Identifier "Framework Touchpad"
            MatchProduct "PIXA3854:00 093A:0274 Touchpad"
            Driver "libinput"
            Option "AccelSpeed" "0.5"
            Option "Tapping" "on"
            Option "NaturalScrolling" "true"
            Option "ClickMethod" "clickfinger"
          EndSection

