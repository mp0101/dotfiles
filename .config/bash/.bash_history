iwctl
clear
sudo pacman -Syyu
clear
sudo pacman -S nano
sudo nano /etc/pacman.conf
clear
sudo pacman -Syyu
sudo pacman -S lightdm-greeter lightdm lightdm-greeter-settings
sudo pacman -S lightdm-gtk-greeter lightdm lightdm--gtk-greeter-settings
sudo pacman -S lightdm-gtk-greeter lightdm lightdm-gtk-greeter-settings
sudo systemctl enable lightdm
clear
sudo pacman -S xfce4 xfce4-goodies
sudo pacman -S xfce4 xfce4-goodies
reboot
sudo pacman -S xorg-xserver
sudo pacman -S xorg-server
sudo pacman -S man
reboot
sudo pacman -S network-manager-applet
sudo pacman -S pavucontrol
clear
sudo pacman -S firefox
sudo pacman -S ttf-roboto ttf-roboto-mono
sudo pacman -S ttf-iosevka-nerd
reboot
sudo pacman -S git
mkdir Downloads
cd Downloads
git clone https://github.com/Cervexa/Desert_Dark.git
git clone https://github.com/yeyushengfan258/Future-cursors.git
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd Future-cursors/
sudo ./install.sh
cd ..
cd WhiteSur-icon-theme/
sudo ./install.sh -b
cd ..
ls
mkdir ~/.local/share/themes
mv Desert_Dark/ ~/.local/share/themes/
sudo pacman -Syyu
clear
exit
sudo pacman -Syyu
clear
pacman -Qdt
pacman -Qdt neovim
pacman -Qi neovim
clear
sudo pacman -S neovim
clear
ls -la
clear
reboot
sudo pacman -S go
sudo nano /etc/lightdm/lightdm.conf 
sudo groupadd -r autologin
sudo gpasswd -a mp autologin
clear
reboot
cd Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
ls
ls -la
makepkg -si
yay -S update-grub
sudo nano /etc/default/grub
clear
sudo update-grub
sudo pacman -Syyu
clear
man 5 fonts-conf
nano /usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf
sudo ln -s /usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf /etc/fonts/conf.d/10-nerd-font-symbols.conf
exit
fc-cache -fv
clear
sudo pacman -S chromium
clear
sudo pacman -Ss ttf-
sudo pacman -S ttf-nerd-fonts-symbols
fc-cache -fv
ls -la /etc/fonts/conf.d/
ls -la /etc/fonts/conf.d/
fc-cache -fv
sudo fc-cache -fv
reboot
sudo pacman -S neovim
sudo pacman -S xclip
sudo pacman -S python-neovim
clear
nvim
clear
ls -la
mkdir -p ~/.config/bash
sudo pacman -S zsh
chsh -s $(which zsh)
exit
ls
ls -la
mkdir -p ~/.config/zsh
touch ~/.config/zsh/{.zshrc,.zshenv}
ls ~/.config/zsh
ls -la ~/.config/zsh
ln -s ~/.config/zsh/.zshenv ~/
ls
ls -la
nano ~/.zshenv
clear
ls -la
exit
reboot
