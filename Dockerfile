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

USER dev
WORKDIR /home/dev

ENV JAVA_HOME /usr/lib/jvm/java-8-jdk
ENV PATH /usr/lib/jvm/java-8-jdk/bin:$PATH

COPY install_eclipse.sh ./install_eclipse.sh
RUN ./install_eclipse.sh

RUN curl -O http://heanet.dl.sourceforge.net/project/eclim/eclim/2.4.1/eclim_2.4.1.jar
RUN java -Dvim.files=$HOME/.vim -Declipse.home=$HOME/eclipse -jar eclim_2.4.1.jar install && rm $HOME/eclim_2.4.1.jar
