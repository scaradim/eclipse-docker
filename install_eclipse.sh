curl -O http://ftp.fau.de/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz && \
tar -zvxf eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz && \
ls -al && \
rm eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz
DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.dltk.core.feature.group
 DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.dltk.ruby.feature.group
 DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.jdt.feature.group
 DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site -installIU org.scala-ide.sdt.feature.feature.group
