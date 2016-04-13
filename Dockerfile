#Base Image
FROM ubuntu:14.04
RUN apt-get update

#Install Python and dependencies
RUN apt-get install -y python python-pip 
RUN apt-get install -y python-dev
RUN apt-get install -y zlib1g-dev
RUN pip install --upgrade pip
COPY requirements.txt /usr/local
RUN pip install -r /usr/local/requirements.txt

#Copy Galaxy File
COPY galaxy /usr/local/galaxy

# Install PostgreSQL and dependencies
RUN apt-get install postgresql -y
RUN apt-get install git -y
RUN apt-get install mercurial -y


EXPOSE 5000

#RUN
WORKDIR /usr/local/galaxy
CMD ["./run.sh"]

