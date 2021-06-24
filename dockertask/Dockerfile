FROM alpine:3.14
COPY main.py .
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip flask==2.0.0 
ENTRYPOINT ["python3"]
CMD ["main.py"]
