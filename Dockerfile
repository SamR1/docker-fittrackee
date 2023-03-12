FROM python:3.9

MAINTAINER SamR1@users.noreply.github.com

RUN apt-get update && apt-get -y install supervisor

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# copy needed files
COPY scripts/ /usr/src/app/scripts
COPY .env /usr/src/app
COPY docker-entrypoint.sh /usr/src/app
COPY supervisor/ /usr/src/app/supervisor

RUN ln -s /usr/src/app/supervisor/fittrackee.supervisor.conf /etc/supervisor/conf.d/fittrackee.supervisor.conf
RUN ln -s /usr/src/app/supervisor/fittrackee-workers.supervisor.conf /etc/supervisor/conf.d/fittrackee-workers.supervisor.conf


# install fittrackee from pip
ENV VIRTUAL_ENV=/usr/src/app/.venv
RUN python3 -m venv $VIRTUAL_ENV
RUN $VIRTUAL_ENV/bin/pip install --upgrade pip setuptools wheel
RUN $VIRTUAL_ENV/bin/pip install fittrackee

# create uploads folder
CMD mkdir -p $UPLOAD_FOLDER

# environment variables
ARG APP_WORKERS
ARG GUNICORN_TIMEOUT
ARG GUNICORN_LOG
ARG GUNICORN_THREADS

# run supervisor
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]