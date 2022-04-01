FROM busybox:latest
RUN adduser --disabled-password -s /bin/sh dockeruser 
USER dockeruser
WORKDIR /home/dockeruser

HEALTHCHECK --interval=5m --timeout=3s --retries=2 CMD /my-static-binary || exit 1
