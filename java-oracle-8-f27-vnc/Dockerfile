FROM wagnermarques/fzl_vnc:0.0.1

MAINTAINER wagnerdocri@gmail.com


#if you are not behind a proxy, comments this out                                                                                                                               
ENV http_proxy=http://wagner:nicolas1*@192.168.0.2:3128/              
ENV ftp_proxy=http://wagner:nicolas1*@192.168.0.2:3128/
ENV all_proxy=http://wagner:nicoals1*@192.168.0.2:3128/                                                                                                                        
                                                                                                                                                              
RUN echo "proxy=http://192.168.0.2:3128/" >> /etc/dnf/dnf.conf
RUN echo "proxy_username=wagner" >> /etc/dnf/dnf.conf                                                                             
RUN echo "proxy_password=nicolas1*" >> /etc/dnf/dnf.conf                                                                                                                        
                                                               
ENV JDK_TARBALL=jdk-8u131-linux-x64.tar.gz

RUN dnf -y update
RUN dnf -y install tar wget  && dnf clean all

RUN mkdir -p /opt/jdk
RUN wget --output-document /opt/jdk/$JDK_TARBALL  -e use_proxy=on -e http_proxy=$http_proxy -e https_proxy=$http_proxy  \
         --no-cookies --no-check-certificate \
         --header "Cookie:s_nr=1484102101551; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz"


RUN cd /opt/jdk && tar xvf $JDK_TARBALL 

ENV JAVA_HOME=/opt/jdk/jdk1.8.0_131
ENV PATH=$PATH:$JAVA_HOME/bin 
RUN cd /opt/jdk && tar xvf $JDK_TARBALL 



#FROM: https://gist.github.com/voor/b2dd473db296d9eae004
## OpenJDK started using 18000XX as their priority, so kick it up to 2 million to surpass them.
RUN update-alternatives --install /usr/bin/java   java     $JAVA_HOME/bin/java 2000000
RUN update-alternatives --install /usr/bin/javaws javaws   $JAVA_HOME/bin/javaws 2000000
RUN update-alternatives --install /usr/bin/javac  javac    $JAVA_HOME/bin/javac 2000000
RUN update-alternatives --install /usr/bin/jar    jar      $JAVA_HOME/bin/jar 2000000

RUN update-alternatives --set java $JAVA_HOME/bin/java
RUN update-alternatives --set javaws $JAVA_HOME/bin/javaws
RUN update-alternatives --set javac $JAVA_HOME/bin/javac
RUN update-alternatives --set jar $JAVA_HOME/bin/jar



