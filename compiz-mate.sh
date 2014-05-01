#!/bin/bash
#
####  Script criado por Dagoberto S. Araújo ####
####                                        #### 
####  Instalação do Compiz-Mate no Debian   ####
####      para debian 32bits e 64bits       ####

##### Atualizamos o sistema

apt-get upgrade -y --force-yes

##### Adicionamos o repositório da distribuição Pointlinux 2.3 no Debian Wheezy

su -c "echo 'deb http://cdn.pointlinux.org/pointlinux/ taya main contrib non-free' > /etc/apt/sources.list.d/pointlinux.list"
su -c "echo 'deb-src http://cdn.pointlinux.org/pointlinux/ taya main contrib non-free' >> /etc/apt/sources.list.d/pointlinux.list"

##### Atualizamos a lista de pacotes

apt-get update

##### O conteúdo do arquivo pointlinux.gpg que é a chave pública do repositório da distribuição pointlinux 2.3, presente no diretório /usr/share/keyrings, pode ser visto neste link:

wget -c https://www.dropbox.com/s/ydw2m53c5ex5zp7/pointlinux.gpg

apt-key add pointlinux.gpg

##### Opcionalmente podemos guardar o arquivo pointlinux.gpg em /usr/share/keyrings, ou removemos:

rm pointlinux.gpg

##### Agora atualizamos a lista de pacotes

apt-get update

##### INSTALAÇÃO

apt-get install compiz compiz-mate compiz-locales compiz-fusion-plugins-extra compiz-fusion-plugins-main compiz-fusion-plugins-unsupported emerald simple-ccsm -y --force-yes

##### Alguns temas para emerald

wget -c -O emerald-themes.deb http://goo.gl/gcC4wl

dpkg -i emerald-themes.deb; rm emerald-themes.deb

##### Tema T-ish+Metal para emerald (http://goo.gl/9LTISp)

cd /usr/share/emerald/themes
wget -c -O Mac.tar.bz2 http://gnome-look.org/CONTENT/content-files/137977-T-ish%20Metal%201.0.tar.bz2
tar -jxvf Mac.tar.bz2
mv T-ish\ Metal\ 1.0 T-ish_Metal_1.0
rm Mac.tar.bz2; cd -

##### Efeito onda única

wget -c -O efeito_onda_única.tar.gz http://goo.gl/GqjLDL

tar -xvvf efeito_onda_única.tar.gz

mv libanimation.so /usr/lib/compiz/; mv animation.xml /usr/share/compiz/animation.xml; rm efeito_onda_única.tar.gz

##### Remoção do repositório pointlinux, basta executar o seguinte comando:

sudo rm -fv /etc/apt/sources.list.d/pointlinux.list

#####Atualizamos a lista de repositórios:

sudo apt-get update
