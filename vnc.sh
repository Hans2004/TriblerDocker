#!/bin/bash

# Remove VNC lock (if process already killed)
rm /tmp/.X1-lock /tmp/.X11-unix/X1
# Run VNC server with tail in the foreground
USER=root vncserver :1 -geometry 1800x900 -depth 24
