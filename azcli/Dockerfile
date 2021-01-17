FROM mcr.microsoft.com/azure-cli:2.9.1 AS base

COPY login.sh .

RUN chmod +x login.sh

CMD ["./login.sh"]
