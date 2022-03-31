FROM busybox:latest
RUN su 
USER dockeruser
WORKDIR /home/dockeruser
COPY ./my-static-binary /my-static-binary
CMD ["/my-static-binary"]

HEALTHCHECK --interval=5m --timeout=3s --retries=2 CMD /my-static-binary || exit 1
