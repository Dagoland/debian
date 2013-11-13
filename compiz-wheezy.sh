#!/bin/bash
#
#### Script criado por Dagoberto S. Araújo ####
####                                       #### 
####    Instalação do Compiz no Debian     ####


##### Adicionamos o repositório Debian Sid Snapshot que contém o pacote compiz

su -c "echo '# Debian Sid Snapshot' > /etc/apt/sources.list.d/debian-sid-snapshot.list"
su -c "echo 'deb http://snapshot.debian.org/archive/debian/20130815T215015Z/ sid main contrib non-free' >> /etc/apt/sources.list.d/debian-sid-snapshot.list"

##### Atualizamos a lista de repositórios

apt-get -o Acquire::Check-Valid-Until=false update

##### Atualizamos o sistema

apt-get -t wheezy dist-upgrade -y --force-yes

##### Instalamos compiz e seus pacotes auxiliares 

apt-get -t unstable install compiz compiz-gtk compizconfig-backend-gconf compizconfig-settings-manager compiz-plugins compiz-fusion-plugins-main compiz-fusion-plugins-extra compiz-fusion-plugins-unsupported fusion-icon -y --force-yes

#### Instalação de pacotes extras para trabalhar com compiz

#### Instalação para 32 Bits ####
 
arch=`uname -m`
if  [ $arch = i686 ] || [ $arch = i386 ]; then

##### Downloads

mkdir pacotes_complementares_do_compiz; cd pacotes_complementares_do_compiz

wget -O libemeraldengine0_0.7.9+git20080923.shame-0_i386.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/libemeraldengine0_0.7.9+git20080923.shame-0_i386.deb

wget -O emerald_0.7.9+git20080923.shame-0_i386.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/emerald_0.7.9+git20080923.shame-0_i386.deb

wget -O emerald-themes_0.7.9+git20071021.shame-1_all.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/emerald-themes_0.7.9+git20071021.shame-1_all.deb

wget -O simple-ccsm_0.7.9+git20080923.shame-0_i386.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/simple-ccsm_0.7.9+git20080923.shame-0_i386.deb

dpkg -i *.deb

apt-get -f install -y --force-yes

rm libemeraldengine0_0.7.9+git20080923.shame-0_i386.deb emerald_0.7.9+git20080923.shame-0_i386.deb emerald-themes_0.7.9+git20071021.shame-1_all.deb simple-ccsm_0.7.9+git20080923.shame-0_i386.deb

cd -; rm pacotes_complementares_do_compiz -rf

##### 64 bits

elif [ $arch = "x86_64" ]; then

##### Downloads

mkdir pacotes_complementares_do_compiz; cd pacotes_complementares_do_compiz

wget -O libemeraldengine0_0.7.9+git20080923.shame-0_amd64.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/libemeraldengine0_0.7.9+git20080923.shame-0_amd64.deb

wget -O emerald_0.7.9+git20080923.shame-0_amd64.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/emerald_0.7.9+git20080923.shame-0_amd64.deb

wget -O emerald-themes_0.7.9+git20071021.shame-1_all.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/emerald-themes_0.7.9+git20071021.shame-1_all.deb

wget -O simple-ccsm_0.7.9+git20080923.shame-0_amd64.deb http://download.tuxfamily.org/shames/debian-sid/desktopfx/unstable/simple-ccsm_0.7.9+git20080923.shame-0_amd64.deb

dpkg -i *.deb

apt-get -f install -y --force-yes

rm libemeraldengine0_0.7.9+git20080923.shame-0_amd64.deb emerald_0.7.9+git20080923.shame-0_amd64.deb emerald-themes_0.7.9+git20071021.shame-1_all.deb simple-ccsm_0.7.9+git20080923.shame-0_amd64.deb

cd -; rm pacotes_complementares_do_compiz -rf

else
        echo "Arquitetura não suportada"
fi

#### Removemos repositório Debian Sid Snapshot 

rm -fv /etc/apt/sources.list.d/debian-sid-snapshot.list

##### Atualizamos a lista de repositórios

apt-get update

echo "Instalação do Compiz concluída"


