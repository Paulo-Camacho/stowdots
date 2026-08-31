## alias for favorite tools
alias ff="fzf" # find files through the cli
alias ls="eza -lh --group-directories-first --icons=auto" # displays ls much like emacs dired
alias cd="z" # Zoxide(ergonomic cd)

# alias fast='fastfetch -c ~/.config/fastfetch/temp.jsonc -l arch' # custom fastfetch display

## applications
picom - makes barebones linux distros nicer to look at [standalone window compositor for X11]

## zshrc vim mode
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

function zle-line-finish { # resets cursor to line mode before displaying a new prompt line 
    echo -ne "\e[6 q"
}
zle -N zle-line-finish

## this makes switch back into normal mode instant.
export keytimeout=1 # terminal vim switching from insert <-> normal, instant


 
## fixing barebones distros interaction with framework trackpad [just download waylandscroll instead]
 ```shell 
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
```
