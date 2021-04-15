# Copyright 2020-2021 Hewlett Packard Enterprise Development LP
FROM arti.dev.cray.com/baseos-docker-master-local/alpine:3
RUN apk add --no-cache py3-pip python3
COPY *.txt /
RUN apk update \
    && apk add --update --no-cache \
        gcc \
        python3-dev \
        libc-dev \
    && pip3 install --no-cache-dir -r requirements.txt
ADD catalog_update.py /

ENTRYPOINT [ "/catalog_update.py" ]
