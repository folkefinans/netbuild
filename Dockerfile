FROM ubuntu:xenial

# install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update -q && apt-get install -y apt-transport-https curl zip python-pip groff-base

# AWS CLI 
RUN pip install awscli==1.11.131

# dotnet toolstack for building/testing
RUN curl -o packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt update
RUN apt install -y dotnet-sdk-3.1.0

WORKDIR /var/app