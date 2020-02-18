ARG CENTOS_VERSION=7.6.1810
FROM centos:${CENTOS_VERSION}

# Common
COPY source/.vimrc /source/
COPY source/init_common.sh /source/
RUN bash /source/init_common.sh

# Java
COPY source/init_java.sh /source/
RUN bash /source/init_java.sh

# Nginx
COPY source/init_nginx.sh /source/
RUN bash source/init_nginx.sh

