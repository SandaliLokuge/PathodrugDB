# Use the Python 3.9.12 container image
FROM python:3.9.12-slim-buster

RUN apt-get update && apt-get install build-essential -y
RUN apt-get update \
    && apt-get install -y build-essential default-libmysqlclient-dev

# Set working directory to app
WORKDIR /app

# Copy the current working directory contents into the container at /app
ADD . /app

# Install the dependencies
RUN pip install -r requirements.txt
RUN pip install mysql-connector-python

# Run the command to start uWSG
CMD ["uwsgi", "app.ini"]


