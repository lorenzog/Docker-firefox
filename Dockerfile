FROM fedora:latest
RUN yum -y install firefox xterm
# default value; overriden on the command line for nested X servers
# ENV DISPLAY :0
CMD firefox
