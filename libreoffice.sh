#!/bin/bash
#
# SempreUpdate emanuelnegromonte@sempreupdate.com.br
# site http://www.sempreupdate.com.br/
# Este programa é um software livre; você pode redistribui-lo e/ou 
# modifica-lo dentro dos termos da Licença Pública Geral GNU (GPL) como 
# publicada pela Fundação do Software Livre (FSF); na versão 3 da 
# Licença.
#
# Este programa é distribuido na esperança que possa ser útil, 
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer
# MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
# Licença Pública Geral GNU (GPL) para maiores detalhes.
#
# Você deve ter recebido uma cópia da Licença Pública Geral GNU (GPL)
# junto com este programa, se não, escreva para a Fundação do Software
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
####################

vs=4.3.7
rev=.2
icons=4.3

####################

[ $(uname -m) == "x86_64" ] && ARCH=x86-64 || ARCH=x86

####################


# Entrando como super usuário temporariamente
sudo mkdir /home/office_$vs

cd /home/office_$vs

#Atualizando a Source list so sistema
#sudo apt-get update


# Baixando os pacotes
sudo wget -c http://download.documentfoundation.org/libreoffice/stable/$vs/deb/${ARCH//-/_}/LibreOffice_$vs\_Linux_$ARCH\_deb.tar.gz 

sudo wget -c http://download.documentfoundation.org/libreoffice/stable/$vs/deb/${ARCH//-/_}/LibreOffice_$vs\_Linux_$ARCH\_deb_helppack_pt-BR.tar.gz

sudo wget -c http://download.documentfoundation.org/libreoffice/stable/$vs/deb/${ARCH//-/_}/LibreOffice_$vs\_Linux_$ARCH\_deb_langpack_pt-BR.tar.gz

# Descompactando os pacotes 
# Libre Office
sudo tar -zxpvf LibreOffice_$vs\_Linux_$ARCH\_deb.tar.gz

# Pacote de  Linguagem Portugues  BR
sudo tar -zxpvf LibreOffice_$vs\_Linux_$ARCH\_deb_helppack_pt-BR.tar.gz

# Pacote de  Ajuda  em Porugues BR
sudo tar -zxpvf LibreOffice_$vs\_Linux_$ARCH\_deb_langpack_pt-BR.tar.gz

# Remoção de versão antiga do Libreoffice

sudo apt-get --purge remove libreoffice* -y --force-yes; cd -
sudo apt-get install -f -y --force-yes
sudo apt-get --purge remove libreoffice* -y --force-yes

# instalando os pacotes
# Libre Office
cd  LibreOffice_$vs$rev\_Linux_$ARCH\_deb/DEBS/
sudo dpkg -i *.deb 

cd  desktop-integration/
sudo dpkg -i --force-all *.deb

cd ../../../LibreOffice_$vs$rev\_Linux_$ARCH\_deb_langpack_pt-BR/DEBS/
# Pacote de  Linguagem Portugues  BR
sudo dpkg -i --force-all *.deb

# Pacote de  Ajuda  em Porugues BR
cd ../../LibreOffice_$vs$rev\_Linux_$ARCH\_deb_helppack_pt-BR/DEBS/

sudo dpkg -i --force-all *.deb

# Removendo arquivos baixados

sudo rm /home/office_$vs -rf

# Ícones para Libreoffice

wget -O icons_flat.zip http://goo.gl/s13AGF; unzip icons_flat.zip; mv images_flat.zip /opt/libreoffice$icons/share/config/images_tango.zip; mv intro.png flat_logo.svg /opt/libreoffice$icons/program/; rm icons_flat.zip

echo " Libre office instalado com  sucesso !"
