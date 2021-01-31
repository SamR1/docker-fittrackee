FROM python:3.9

MAINTAINER SamR1@users.noreply.github.com

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# copy needed files
COPY scripts/ /usr/src/app/scripts
COPY .env /usr/src/app

# install fittrackee from pip
RUN pip install --upgrade pip
RUN pip install fittrackee

# create uploads folder
CMD mkdir $UPLOAD_FOLDER

# run fittrackee server
CMD fittrackee