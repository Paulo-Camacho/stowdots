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
  bit@slayer:~/stowdots$ xinput list
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ FRMW0004:00 32AC:0006 Consumer Control  	id=9	[slave  pointer  (2)]
⎜   ↳ PIXA3854:00 093A:0274 Mouse             	id=10	[slave  pointer  (2)]
⎜   ↳ PIXA3854:00 093A:0274 Touchpad          	id=11	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Video Bus                               	id=6	[slave  keyboard (3)]
    ↳ Power Button                            	id=7	[slave  keyboard (3)]
    ↳ FRMW0004:00 32AC:0006 Wireless Radio Control	id=8	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=12	[slave  keyboard (3)]
    ↳ FRMW0004:00 32AC:0006 Consumer Control  	id=13	[slave  keyboard (3)]
bit@slayer:~/stowdots$ xinput set-prop 11 "libinput Accel Speed" 0.6
