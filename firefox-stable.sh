#!/bin/bash
# Script de empacotamento do Firefox versão 2.1
# Testado com Firefox 20.0
# Baixa, descompacta e cria um pacote deb da versão mais recente
# Criado por Leandro Nkz < http://brweatherproject.blogspot.com.br >
# Modificado por dagoland < http://www.dagoland.blogspot.com.br >
 
clear


## Verificando se o usuário é root.

if [ `whoami` = "root" ] ; then
 echo ""
 echo "Erro: Este script deve ser executado apenas como usuário normal."
 echo ""
 exit 1s
fi
 
## Checando dependências.

if [ -z `which curl` ] ; then
 clear
 echo ""
 echo "Este script necessita do pacote curl para funcionar.
Instale-o com o comando:
 
sudo apt-get install curl -y
"
exit 1
fi
 
if [ -z `which bzip2` ] ; then
 clear
 echo ""
 echo "Este script necessita do pacote bzip2 para funcionar.
Instale-o com o seguinte comando:

sudo apt-get install bzip2 -y
"
 exit 1
fi
  
## Definindo a arquitetura.

echo "Selecione a arquitetura do pacote:
 
1 = 32 bits
2 = 64 bits
"
echo -n "Resposta: " ; read ARCH
 
## Baixando pacote tar.bz2.

case $ARCH in
 "1")
    ARCH="i386"
    VERSION=`curl -s "http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-i686/pt-BR/" | grep tar.bz2 | head -n1 | cut -f2 -d'-' | cut -f1 -d'"'`
echo ""
    echo "Realizando o download da versão 32 bits..."
    wget -c -T0 -v "http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-i686/pt-BR/firefox-$VERSION"
 
;;
 "2")
    ARCH="amd64"
    VERSION=`curl -s "http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-x86_64/pt-BR/" | grep tar.bz2 | head -n1 | cut -f2 -d'-' | cut -f1 -d'"'`
echo ""
    echo "Realizando o download da versão 64 bits..."
    wget -c -T0 -v "http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-x86_64/pt-BR/firefox-$VERSION"
;;
 *)
    echo "Escolha 1 ou 2. Instalação abortada" && exit 1
;;
esac
  
## Criando diretórios.

echo ""
echo "Criando diretórios temporários..."
mkdir -p firefox/{opt,DEBIAN,usr/share/applications,usr/share/pixmaps,usr/bin}
 
## Extraindo e conferindo o arquivo baixado.

ERRO2(){
 clear
 echo "Falha ao baixar arquivo tar.bz2.
Verifique a sua conexão com a Internet e tente novamente."
 rm -r firefox
 exit 1
}
 
echo ""
echo "Extraindo..."
tar -xjf firefox-$VERSION -C firefox/opt 2>/dev/null || ERRO2
 
## Definindo versão.

VERSION=`echo $VERSION | sed 's/-//g ; s/.tar.bz2//g'`
 
## Criando o arquivo control.

echo ""
echo "Criando arquivo de controle..."

touch firefox/DEBIAN/control

echo "Package: firefox
Version: $VERSION
Architecture: $ARCH
Maintainer: Mozilla Foundation
Installed-Size: `du -s firefox/opt/firefox | cut -f1 -d'f' | sed 's/\t//'`
Depends: libglib2.0-0 (>= 2.24.2), libgtk2.0-0 (>= 2.20.1), libpango1.0-0 (>= 1.28.3),libstdc++6 (>= 4.3)
Recommends: libdbus-1-3 (>= 1.2.24), libdbus-glib-1-2 (>= 0.88)
Provides: gnome-www-browser, x-www-browser
Section: web
Priority: optional
Description: Mozilla Firefox
 O Firefox oferece segurança e uma navegação web mais fácil. Possui uma interface de usuário familiar,
 recursos aprimorados de segurança, incluindo proteção contra roubo de identidade online,
 além de ser totalmente personalizável." > firefox/DEBIAN/control
 
## Criando atalhos de menus.

echo ""
echo "Criando atalhos de menus..."

echo "[Desktop Entry]
Version=$VERSION
Name=Firefox
Comment=Navegue na Internet
GenericName=Web Browser
Exec=/opt/firefox/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=firefox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupWMClass=Firefox
StartupNotify=true
X-Ayatana-Desktop-Shortcuts=NewWindow;
 
[NewWindow Shortcut Group]
Name=Abrir nova janela
Exec=firefox -new-window
TargetEnvironment=Unity" > firefox/usr/share/applications/firefox.desktop
 
# Tornando executável o lançador de menu.

chmod +x firefox/usr/share/applications/firefox.desktop
 
## Criação de ícones.

cp firefox/opt/firefox/browser/icons/mozicon128.png firefox/usr/share/pixmaps/firefox.png
  
## Script pós-instalação.
 
echo '#!/bin/sh

# postinst script.
 
set -e
 
echo "Definindo Firefox como browser padrão..."
update-alternatives --install /usr/bin/firefox firefox /opt/firefox/firefox 45
update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/firefox/firefox 210
update-alternatives --install /usr/bin/gnome-www-browser gnome-www-browser /opt/firefox/firefox 210
 
exit 0' > firefox/DEBIAN/postinst
chmod +x firefox/DEBIAN/postinst
 
## Script pré-remoção.

echo '#!/bin/sh
# prerm script
 
set -e
 
echo "Removendo Firefox como browser padrão..."
update-alternatives --remove gnome-www-browser /opt/firefox/firefox
update-alternatives --remove x-www-browser /opt/firefox/firefox
update-alternatives --remove firefox /opt/firefox/firefox
rm -rf /opt/firefox
 
exit 0' > firefox/DEBIAN/prerm
chmod +x firefox/DEBIAN/prerm
 
## Construção do pacote .deb.

echo ""
dpkg -b firefox firefox-$VERSION-$ARCH.deb
 
## Removendo diretórios e arquivos temporários.

rm -rf firefox
 
# FIM.

echo ""
echo "Criação do pacote deb completa!"
echo ""
echo "Agora, basta instalar o pacote deb criado com o seguinte comando:
 
dpkg -i firefox-$VERSION-$ARCH.deb
"
exit 0
