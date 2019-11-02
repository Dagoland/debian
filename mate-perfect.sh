#!/bin/bash
#
# Script para instalçao do tema Dagoland em MATE-desktop
#
# Este script não deve ser usado como root
#
#
#### Verificando se o usuário é root ####
if [ `whoami` = "root" ] ; then
 echo ""
 echo "Erro: Este script deve ser executado apenas como usuário comum e não como super usuário ou root."
 echo ""
 exit 1s
fi
#### Preparando as pastas de recepção dos aquivos a serem baixados ####
cd /home/`whoami`/
mkdir .themes 2> /dev/null
mkdir .icons 2> /dev/null
mkdir .fonts 2> /dev/null
#
##### Download Tema GTK: Dagoland para MATE #####
wget -O Dagoland.zip https://www.dropbox.com/s/odxe8xrwqksng5w/Dagoland.zip
unzip Dagoland.zip
mv Dagoland /home/`whoami`/.themes
rm Dagoland.zip
#
##### Download Tema GTK: Dagoland-blue para MATE #####
wget -O Dagoland-blue.zip https://www.dropbox.com/s/55cp95eca4phx5j/Dagoland-blue.zip
unzip Dagoland-blue.zip
mv Dagoland-blue /home/`whoami`/.themes
rm Dagoland-blue.zip
#
##### Download Tema GTK: Equus para MATE #####
wget -O Equus.zip https://www.dropbox.com/s/pfq6jdl583qvzo4/Equus.zip
unzip Equus.zip
mv Equus /home/`whoami`/.themes
rm Equus.zip
#
##### Download Tema GTK: Equus-2 para MATE #####
wget -O Equus-2.zip https://www.dropbox.com/s/9k62akx9ym33xrx/Equus-2.zip
unzip Equus-2.zip
mv Equus-2 /home/`whoami`/.themes
rm Equus-2.zip
#
##### Download Tema GTK: eOS para MATE #####
wget -O eOS.zip https://www.dropbox.com/s/h6k4a2iknodguor/eOS.zip
unzip eOS.zip
mv eOS /home/`whoami`/.themes
rm eOS.zip
#
##### Download Tema GTK: eOS para MATE #####
wget -O eOSy.zip https://www.dropbox.com/s/yugs37aahzke6xh/eOSy.zip
unzip eOSy.zip
mv eOSy /home/`whoami`/.themes
rm eOSy.zip
#
##### Download Tema de ícones: Dagoland #####
wget -O Dagoland.zip https://www.dropbox.com/s/98z6ln93x3jnt7m/Dagoland.zip
unzip Dagoland.zip
mv Dagoland /home/`whoami`/.icons 
rm Dagoland.zip
#
##### Download Tema de ícones: Dagoland-Mac #####
wget -O Dagoland-Mac.zip https://www.dropbox.com/s/apd92nyexxt102y/Dagoland-Mac.zip
unzip Dagoland-Mac.zip
mv Dagoland-Mac /home/`whoami`/.icons 
rm Dagoland-Mac.zip
#
##### Download tema para cursor do mouse Dagoland-Cursors #####
###############################################################
wget -O Dagoland-Cursors.zip https://www.dropbox.com/s/2ywo8dfnfjz0fmi/Dagoland-Cursors.zip
unzip Dagoland-Cursors.zip
mv Dagoland-Cursors /home/`whoami`/.icons
rm Dagoland-Cursors.zip
#
##### Download Fonte mac.zip #####
##################################
wget -O mac.zip https://www.dropbox.com/s/vemmtiokd6kkpg1/mac.zip
unzip mac.zip
mv mac /home/`whoami`/.fonts/
rm mac.zip
#
##### Download Fonte gbk.zip #####
##################################
wget -O gbk.zip https://www.dropbox.com/s/q70yilbf64zth6t/gbk.zip
unzip gbk.zip
mv gbk /home/`whoami`/.fonts/
rm gbk.zip
#
##### Download Fonte gbk.zip #####
##################################
wget -O latin.zip https://www.dropbox.com/s/giu8akey89kbx9r/latin.zip
unzip latin.zip
mv latin /home/`whoami`/.fonts/
rm latin.zip
#
# Preferências de aparência (Padrão)
#
# 1 Fonte de aplicativos:                Sans 10         
# 2 Fonte de documentos:                 Sans 10  
# 3 Fonte da área de trabalho:           Sans 10
# 4 Fonte do título de janelas:     Sans Bold 10
# 5 Fonte de largura fixa:          Monospace 10
#
# Ateração para: 
#
# Preferências de aparência
#
# 1 Fonte de aplicativos:           Lucida Grande Regular 10      
# 2 Fonte de documentos:            Lucida Grande Regular 10    
# 3 Fonte da área de trabalho:      Lucida Grande Regular 10
# 4 Fonte do título de janelas:     Lucida Grande Regular 10    
# 5 Fonte de largura fixa:     Lucida Console 10    
#
#### 1 Fonte de aplicativos: ####
gsettings set org.mate.interface font-name 'Lucida Grande Regular 10'
#### 2 Fonte de documentos: ####
gsettings set org.mate.interface document-font-name 'Grande Regular 10'
#### 3 Fonte da área de trabalho: ####
gsettings set org.mate.caja.desktop font 'Lucida Grande Regular 10'
#### 4 Fonte do título de janelas: ####
gsettings set org.mate.Marco.general titlebar-font 'Lucida Grande Regular 10'
#### 5 Fonte de largura fixa: ####
gsettings set org.mate.interface monospace-font-name 'Lucida Console 10'
#
# Aplicação do tema Dagoland
# Tema GTK: "Adwaita" para "Dagoland-blue"
# Tema de ícones: "gnome" para "Dagoland"
# Cursor do mouse "Adwaita" para 
##### Tema GTK: Dagoland-blue ####
gsettings set org.mate.interface gtk-theme 'Equus'
#### Tema de ícones: Dagoland ####
gsettings set org.mate.interface icon-theme 'Dagoland'
#### Cursor do mouse: ####
gsettings set org.mate.peripherals-mouse cursor-theme 'Dagoland-Cursors'
#### tema marco Dagoland-blue
gsettings set org.mate.Marco.general theme 'eOS'
#### Botões do lado esquerdo: ####
gsettings set org.mate.Marco.general button-layout 'close,minimize,maximize:menu'
#### Layout da barra de título de janelas decoradas no lado clien do GTK: ####
gsettings set org.mate.interface gtk-decoration-layout 'close,minimize,maximize:menu'
