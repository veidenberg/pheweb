FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y python3

RUN groupadd -g 568 apps \
  && useradd -m -d /app -s /bin/bash -u 568 -g 568 apps \
  && apt-get install -y python3-pip python3-dev python3-scipy python3-venv libz-dev libffi-dev

USER apps

ENV PATH=$PATH:/app/.local/bin

RUN python3 -m pip install wheel cython
RUN python3 -m pip install pheweb
RUN python3 -m pip install markupsafe==2.0.1

WORKDIR /data

EXPOSE 5000

CMD pheweb