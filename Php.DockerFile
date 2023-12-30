# Use the official PHP image as the base image
FROM php:8.2-fpm

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    unzip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Copy the composer.json and composer.lock files and install dependencies
COPY composer.json composer.lock ./
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code
COPY . .

# Run Composer's autoloader
RUN composer dump-autoload --optimize

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
