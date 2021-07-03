FROM python:3.9

MAINTAINER SamR1@users.noreply.github.com

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# copy needed files
COPY scripts/ /usr/src/app/scripts
COPY .env /usr/src/app

# install fittrackee from pip
ENV VIRTUAL_ENV=/usr/src/app/.venv
RUN python3 -m venv $VIRTUAL_ENV
RUN $VIRTUAL_ENV/bin/pip install --upgrade pip setuptools wheel
RUN $VIRTUAL_ENV/bin/pip install fittrackee

# create uploads folder
CMD mkdir -p $UPLOAD_FOLDER

# environment variables
ARG HOST
ARG PORT
ARG APP_WORKERS
ARG GUNICORN_TIMEOUT
ARG GUNICORN_LOG
ARG GUNICORN_THREADS

# run fittrackee server w/ gunicorn
CMD $VIRTUAL_ENV/bin/gunicorn -b $HOST:$PORT "fittrackee:create_app()" --error-logfile $GUNICORN_LOG --timeout $GUNICORN_TIMEOUT --workers=$APP_WORKERS --threads=$GUNICORN_THREADS --worker-class=gthread