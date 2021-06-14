export EDITOR=vim
export BROWSER=firefox
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
set PATH $PATH $HOME/.local/bin $HOME/.gem/ruby/2.7.0/bin $HOME/bin $HOME/.cabal/bin $HOME/.ghcup/bin

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty &> /dev/null
    end
end
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"



abbr -a -U -- :q exit
abbr -a -U -- attention ~/.attention.sh
abbr -a -U -- caffein 'xset s off; xset dpms 0 0 0'
abbr -a -U -- clearAP 'sudo rm /tmp/create_ap.all.lock'
abbr -a -U -- dhbackup 'env RESTIC_PASSWORD=1 restic backup --repo /home/sarius/.dh-backup/ /home/sarius/DHBW/'
abbr -a -U -- docbackup 'restic -r rclone:onedrive:phoenix-min-backup -p .resticpw --exclude-file .rexcludes backup /home/sarius/Documents/'
abbr -a -U -- encrypted 'sudo encfs --public /mntx/Elements/.encrypted/ ~/foo/'
abbr -a -U -- ewmv1 'docker run -e ODATA_USER=root -e ODATA_PASSWORD=123 -p 8080:8080 ewm-sim-v1'
abbr -a -U -- ewmv2 'docker run -e ODATA_USER=root -e ODATA_PASSWD=123 -p 8080:8080 ewm-sim-v2'
abbr -a -U -- hibernate 'sudo systemctl hibernate'
abbr -a -U -- i3conf 'vim /home/sarius/.config/i3/config'
abbr -a -U -- inst 'sudo pacman -S'
abbr -a -U -- llgdown 'sudo wg-quick down llg0'
abbr -a -U -- llgr 'sudo ip r del default via 10.1.0.1; sudo ip r add default via 10.0.0.2'
abbr -a -U -- llgup 'sudo wg-quick up llg0; sudo wg set llg0 peer Ll0Zb5I3L8H4WCzowkh13REiXcxmoTgSKi01NrzKiCM=  endpoint "[2001:41d0:1004:1629:1337:187::]:51822"; sudo ip li set dev llg0 mtu 1280'
abbr -a -U -- lsless 'ls --color | less -r'
abbr -a -U -- lsnet 'iwctl station wlan0 scan; iwctl station wlan0 get-networks'
abbr -a -U -- lyc 'ssh lycus'
abbr -a -U -- mh 'sshfs -o ssh_command="ssh -i ~/.ssh/mh_rsa" -p2222 192.168.178.232:/storage/CC8F-530C ~/handy/sd; sshfs -o ssh_command="ssh -i ~/.ssh/mh_rsa" -p2222 192.168.178.232:/storage/emulated/0 ~/handy/internal'
abbr -a -U -- mounta 'sudo mount -a'
abbr -a -U -- qi 'pacman -Qi'
abbr -a -U -- qs 'pacman -Qs'
abbr -a -U -- remov 'sudo pacman -Rns'
abbr -a -U -- restic-excludes 'sudo vim /root/restic-excludes'
abbr -a -U -- selnet 'iwctl station wlan0 connect'
abbr -a -U -- speedtest speedtest-cli
abbr -a -U -- startx 'exec startx'
abbr -a -U -- syu 'sudo pacman -Syu'
abbr -a -U -- umh 'fusermount -u ~/handy/sd; fusermount -u ~/handy/internal'
abbr -a -U -- wacom xsetwacom
abbr -a -U -- whotspot 'sudo create_ap wlp5s0 wlp5s0 ThinkAP r00tMeN0w!!'
