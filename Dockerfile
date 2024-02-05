FROM azinchen/duplicacy:3.4.0

RUN apk add --no-cache \
        curl

# Highjack mailto script to grab logs for the healthcheck
RUN mv /usr/bin/mailto.sh /usr/bin/mailto-original.sh

COPY root /

ENV HEALTHCHECK_URL=
