# How to use this Dockerfile
# Build with: docker build --rm -t tribler .
# 
# Run the container with: docker run -ti --name="tribler" -p 5901:5901 -v /home/xxx/dockerfiles/tribler-dockerfile/Downloads:/root/Downloads tribler /bin/bash
# 
# After quitting the container, it can be re-attached with: docker restart tribler
#															docker attach tribler
#
# For copy/paste from host: add autocutsel -fork to the xstartup file in /root/.vnc directory.
# 
# After entering bash shell type: vncpasswd and enter a new password.
# Or: RUN echo "password\npassword\n\n" | vncpasswd
# Then start the vnc.sh script manually.
# 
# From the client type: vncviewer 127.0.0.1:5901
#

# Start with Ubuntu base image
FROM ubuntu:15.10
MAINTAINER Hans de Jong <xxx@xxx.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  lxde-core \
  wget \
  gdebi
  
# RUN wget https://jenkins.tribler.org/job/Build-Tribler_Ubuntu-64_devel/lastStableBuild/artifact/tribler_6.6.0-pre-exp-48-g4aad371_all.deb
# RUN wget https://jenkins.tribler.org/job/Build-Tribler_Ubuntu-64_devel/lastSuccessfulBuild/artifact/tribler_6.6.0-pre-exp-264-gdffcfce_all.deb
RUN wget https://github.com/Tribler/tribler/releases/download/v6.5.2/tribler_6.5.2_all.deb
RUN gdebi --n tribler_6.5.2_all.deb

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  roxterm \
  autocutsel \
  tightvncserver


# Set user for VNC server (USER is only for build)
ENV USER root

RUN echo "password\npassword\n\n" | vncpasswd

EXPOSE 5901

# Copy VNC script that handles restarts
COPY vnc.sh /
COPY xstartup /root/.vnc/
CMD ["/bin/bash"]
