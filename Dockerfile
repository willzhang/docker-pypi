FROM centos:7.8.2003 as builder

COPY requirements.txt .

RUN yum install -y python-devel libffi-devel gcc openssl-devel libselinux-python \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \ 
    && mkdir -p /data/packages \
    && pip download -d /data/packages -r requirements.txt --no-binary :all:

FROM pypiserver/pypiserver:latest

COPY --from=builder /data/packages/* /data/packages/
