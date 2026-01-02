# base image app
FROM python:3.9-slim

# working directory in the container
WORKDIR /app

# install required packages for system
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# copy requirements and requirements move container directory
COPY requirements.txt .

# install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# copy flask-app code and move code container directory 
COPY . .

# command to run your application
CMD ["python","app.py"]
