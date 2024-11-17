FROM gcc:14.2.0

# Install inotify-tools for file watching
RUN apt-get update && \
    apt-get install -y inotify-tools && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["make", "watch"]
