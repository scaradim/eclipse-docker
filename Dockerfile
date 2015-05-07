FROM tiokksar/arch

MAINTAINER Tomasz Tokarski tomasz@tomasztokarski.com

ENV HOME /home/dev

WORKDIR /tmp
RUN sudo -u dev curl https://aur.archlinux.org/packages/jd/jdk/jdk.tar.gz | tar zx;\
chown -R dev:dev /tmp ;\
cd jdk && \
ls -al ;\
sudo -u dev makepkg --noconfirm && \
pacman --noconfirm -U *.tar.xz

WORKDIR /home/dev
RUN sudo -u dev curl http://ftp.fau.de/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz | tar zx
RUN sudo -u dev curl -O http://heanet.dl.sourceforge.net/project/eclim/eclim/2.4.1/eclim_2.4.1.jar
USER dev

ENV JAVA_HOME /usr/lib/jvm/java-8-jdk
ENV PATH /usr/lib/jvm/java-8-jdk/bin:$PATH

RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.dltk.core.feature.group
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.dltk.ruby.feature.group
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.jdt.feature.group
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site -installIU org.scala-ide.sdt.feature.feature.group
RUN java -Dvim.files=$HOME/.nvim -Declipse.home=$HOME/eclipse -jar eclim_2.4.1.jar install
