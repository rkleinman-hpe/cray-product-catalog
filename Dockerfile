# Copyright 2020 Hewlett Packard Enterprise Development LP
FROM dtr.dev.cray.com/baseos/alpine:3
RUN apk add --no-cache py3-pip python3
COPY *.txt /
RUN pip3 install --no-cache-dir -r requirements.txt
ADD catalog_update.py /

ENTRYPOINT [ "/catalog_update.py" ]
