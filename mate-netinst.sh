#!/bin/bash
#-------------------------------------------------------------------------------
#Created by Dagoberto Araújo: dagoland7[at]gmail[dot]com
#-------------------------------------------------------------------------------
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------
#
#### Sccript de instalação do MATE no Debian Wheezy ####

echo "Limpando a Sources.list da linha 1 a linha 20"

sed -i '1,20d' /etc/apt/sources.list | more

su -c "echo '#### Repósitório Debian Wheezy ####' >> /etc/apt/sources.list"
su -c "echo 'deb http://http.debian.net/debian/ wheezy main contrib non-free' >> /etc/apt/sources.list"
su -c "echo 'deb http://sft.if.usp.br/debian-security/ wheezy/updates main contrib non-free' >> /etc/apt/sources.list"
su -c "echo 'deb http://http.debian.net/debian/ wheezy-updates main contrib non-free' >> /etc/apt/sources.list"
su -c "echo 'deb http://http.debian.net/debian/ wheezy-backports main contrib non-free' >> /etc/apt/sources.list"

#### Repositório MATE para Debian Wheezy ####

su -c "echo '# main repository' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo 'deb http://repo.mate-desktop.org/debian wheezy main' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo '#' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo '# mirrors' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo 'deb http://packages.mate-desktop.org/repo/debian wheezy main' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo 'deb http://mirror1.mate-desktop.org/debian wheezy main' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo '#' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo '# main repository' >> /etc/apt/sources.list.d/mate-desktop.list"
su -c "echo 'deb http://repo.mate-desktop.org/archive/1.8/debian/ wheezy main' >> /etc/apt/sources.list.d/mate-desktop.list"

apt-get update

apt-get --yes --quiet --allow-unauthenticated install mate-archive-keyring -y --force-yes

apt-get update; apt-get dist-upgrade -y --force-yes

#### Instalação dos diretórios do usuário: Documentos, Downloads, Música, Imagens, Vídeos, etc.

apt-get install xdg-user-dirs -y --force-yes

#### Instalação do Xorg

apt-get install xorg -y --force-yes

#### Instalação de MATE

apt-get install mate-desktop-environment-extra

#### Instalação de pacotes extras para MATE

apt-get install mate-sensors-applet-nvidia -y --force-yes
apt-get install libcanberra-gtk-module -y --force-yes -y 
apt-get install mate-user-share -y --force-yes -y 
apt-get install sound-theme-freedesktop -y --force-yes
apt-get install caja-gksu -y --force-yes
apt-get install caja-image-converter -y --force-yes -y 
apt-get install caja-open-terminal -y --force-yes -y 
apt-get install caja-sendto -y --force-yes

#### Instalação de ferramentas de descompressão

apt-get install unzip -y --force-yes

#### Instalação e configuração de lightdm

apt-get install lightdm -y --force-yes

dpkg-reconfigure lightdm

#### Instalação do navegador Iceweasel

apt-get install iceweasel -y --force-yes

#### Reiniciando o sistema

shutdown -r now
