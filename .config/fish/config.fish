abbr mh 'sshfs -o ssh_command="ssh -i ~/.ssh/mh_rsa" -p2222 192.168.178.232:/storage/CC8F-530C ~/handy/sd; sshfs -o ssh_command="ssh -i ~/.ssh/mh_rsa" -p2222 192.168.178.232:/storage/emulated/0 ~/handy/internal'
abbr umh 'fusermount -u ~/handy/sd; fusermount -u ~/handy/internal'
abbr lyc ssh lycus
abbr inst sudo pacman -S
abbr remov sudo pacman -Rns
abbr llgr 'sudo ip r del default via 10.1.0.1; sudo ip r add default via 10.0.0.2'
abbr syu sudo pacman -Syu
abbr startx exec startx
abbr wpa wpa_cli -i wlan0
abbr :q exit
alias please sudo

export EDITOR=vim
export BROWSER=firefox
set PATH $PATH /home/sarius/.local/bin /home/sarius/.gem/ruby/2.7.0/bin /home/sarius/bin

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty &> /dev/null
    end
end
