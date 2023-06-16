FROM azinchen/duplicacy:2.9.1

RUN apk add --no-cache \
        curl

# Highjack mailto script to grab logs for the healthcheck
RUN mv /usr/bin/mailto.sh /usr/bin/mailto-original.sh

COPY root /

ENV HEALTHCHECK_URL=
