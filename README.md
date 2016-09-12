With this Dockerfile you can run tribler from other distributions than those that are based on Debian, such as OpenSuse or Fedora that don't have elliptic curves enabled.

You can build the image with: docker build --rm -t triblervnc .

The "startTribler.sh" script will start the container, create a Tribler directory in your home directory, and prompt you with a bash command prompt.
From this prompt you can type vnc. This starts the VNC server in the container. Then you can exit the container with CTRL-pq.

Then, start your favourite vncviewer and connect to localhost:5901
The password that is set for the vncserver is: "password"

Then you are presented with a simple desktop and able to start tribler from there.

