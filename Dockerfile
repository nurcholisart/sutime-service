FROM openkbs/jdk11-mvn-py3

MAINTAINER  Author Name <nurcholisart@gmail.com>

WORKDIR /app
COPY ./requirements.txt requirements.txt

RUN pip3 install flask
RUN pip3 install setuptools_scm
RUN pip3 install jpype1
RUN pip3 install sutime
RUN pip3 install gunicorn

COPY . .
RUN mvn dependency:copy-dependencies -DoutputDirectory=./jars

CMD ["gunicorn"  , "-b", "0.0.0.0:5000", "app:app", "--timeout", "90"]