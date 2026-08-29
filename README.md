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


# zshrc vim mode
bindkey -v # use vim motions

function zle-line-init zle-keymap-select {
    # 1. Update the Right Prompt (RPROMPT) based on Vim mode
    if [[ ${KEYMAP} == "vicmd" ]]; then
        RPROMPT="%F{green}-- Normal --%f"
        echo -ne "\e[2 q" # Block cursor
    else
        RPROMPT="%F{green}-- Insert --%f"
        echo -ne "\e[6 q" # Beam/Line cursor
    fi
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# 2. Reset cursor to line mode before displaying a new prompt line
function zle-line-finish {
    echo -ne "\e[6 q"
}
zle -N zle-line-finish

## this makes switch back into normal mode instant.
export keytimeout=1
