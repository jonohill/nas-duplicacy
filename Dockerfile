FROM azinchen/duplicacy:2.6.0

# Highjack mailto script to grab logs for the healthcheck
RUN mv /usr/bin/mailto.sh /usr/local/bin/mailto-original.sh

COPY root /

ENV HEALTHCHECK_URL=
