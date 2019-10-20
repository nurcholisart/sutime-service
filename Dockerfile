FROM  ubuntu:18.04

MAINTAINER  Author Name <nurcholisart@gmail.com>

RUN apt-get -y update
RUN apt install -y -f python3-pip
RUN apt install -y python-dev
RUN apt install -y default-jre
RUN apt install -y default-jdk
RUN apt install maven

WORKDIR /app
COPY ./requirements.txt requirements.txt

RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn

RUN mvn dependency:copy-dependencies -DoutputDirectory=./jars

COPY . .

CMD ["gunicorn"  , "-b", "0.0.0.0:5000", "app:app"]