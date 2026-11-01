
FROM alpine:latest

RUN mkdir -p /app

RUN echo "Patient Data Vault Active" > /app/index.html

EXPOSE 80

CMD ["sh", "-c", "httpd -f -p 80 -h /app"]
