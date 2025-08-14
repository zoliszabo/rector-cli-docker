FROM php:cli

RUN apt-get update && apt-get install -y unzip git && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN composer global require rector/rector
ENV PATH="/root/.composer/vendor/bin:${PATH}"

WORKDIR /app
