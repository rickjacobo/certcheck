FROM mcr.microsoft.com/powershell:alpine-3.10
RUN apk add --no-cache mysql-client
RUN apk add --no-cache openssl
RUN mkdir /powershell
WORKDIR /powershell
COPY Start-Certcheck.ps1 /powershell
CMD pwsh Start-Certcheck.ps1
