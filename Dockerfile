FROM ubuntu:latest
WORKDIR /opt/connectlearn

COPY requirements.txt /opt/connectlearn/

COPY . /opt/connectlearn

RUN chmod +x /opt/connectlearn/src/init_db.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
	    python3-pip 

RUN pip3 install -r requirements.txt

EXPOSE 8000

ENV FLASK_APP=src

RUN /opt/connectlearn/src/init_db.sh

ENTRYPOINT ["/opt/connectlearn/docker-entrypoint.sh"]
