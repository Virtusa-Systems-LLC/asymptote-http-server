FROM python:3.9
ARG UNAME=asymptote
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash -m $UNAME
ADD . /home/asymptote
WORKDIR /home/asymptote
USER $UNAME
RUN pip install -r requirements.txt
EXPOSE 10007
CMD ["python", "server.py"]
