FROM mcr.microsoft.com/powershell:ubuntu-20.04

EXPOSE 80

ENV ENV_ROUTE="api"

RUN apt update
RUN apt install vim -y
RUN apt install openssl -y

RUN mkdir /powershell
WORKDIR /powershell
COPY powershell.ps1 /powershell
COPY handler.ps1 /powershell
CMD pwsh ./handler.ps1