# set base image (host OS)
FROM r-base:4.0.3
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python3.9 python3-pip python3.9-dev

ENV PYTHONPATH "${PYTHONPATH}:/app"

RUN apt-get -y update && apt-get install -y openjdk-11-jre

# copy the dependencies file to the working directory
COPY requirements.txt .
COPY requirements.R .

# install dependencies
RUN pip install -r requirements.txt
RUN apt install -y r-cran-devtools
RUN apt-get install -y librsvg2-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN Rscript requirements.R

RUN wget https://github.com/asad/ReactionDecoder/releases/download/v2.4.1/rdt-2.4.1-jar-with-dependencies.jar


