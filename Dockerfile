FROM alpine:3

RUN apk add --update --no-cache \
    curl \
    ca-certificates \
    bash

COPY drone-google-chat.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/drone-google-chat.sh"]
