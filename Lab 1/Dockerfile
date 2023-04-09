FROM alpine:latest

RUN apk add --no-cache curl

RUN mkdir -p /run/nginx

COPY HealthChecker.sh /app/HealthChecker.sh
RUN chmod +x /app/HealthChecker.sh

RUN echo "* * * * * sh /app/HealthChecker.sh" > /etc/crontabs/root

CMD ["crond", "-f"]