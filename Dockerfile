FROM alpine:3.18.4

RUN apk add --update --no-cache \
    curl \
    ca-certificates \
    bash

COPY drone-google-chat.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/drone-google-chat.sh"]
