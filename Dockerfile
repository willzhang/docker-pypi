FROM pypiserver/pypiserver:latest

COPY requirements.txt .

RUN pip download -d /data/packages -r requirements.txt
