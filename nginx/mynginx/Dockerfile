FROM nginx
RUN mkdir /spring \
    && echo '<h1>hello wolrd nginx</h1>' > /usr/share/nginx/html/index.html \
    && apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
HEALTHCHECK --interval=5s --timeout=3s \
    CMD curl -fs http://localhost/ || exit 1