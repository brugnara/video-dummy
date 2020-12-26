FROM ubuntu

RUN apt-get update && \
  apt-get install -y xserver-xorg-video-dummy && \
  rm -rf /var/lib/apt/lists/*

VOLUME /tmp/.X11-unix

# CMD ["sudo X -config dummy-1920x1080.conf"]
COPY dummy-1920x1080.conf /etc/X11/xorg.conf

CMD [ \
  "/usr/bin/Xorg", "-noreset", \
  "+extension", "GLX", \
  "+extension", "RANDR", \
  "+extension", "RENDER", \
  "-logfile", "./xdummy.log", \
  "-config", "/etc/X11/xorg.conf", \
  ":1" \
]
