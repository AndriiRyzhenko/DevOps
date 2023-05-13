FROM alpine:3.17
RUN apk add --no-cache curl

WORKDIR /app
COPY ./HealthChecker.sh ./
RUN chmod +x ./HealthChecker.sh

RUN echo "* * * * * /bin/sh /app/HealthChecker.sh" >> /etc/crontabs/root

CMD ["crond", "-f"]