FROM php:8-fpm

RUN apt-get update && apt-get install -y \
        libxslt-dev \
        libicu-dev \
        libmcrypt-dev \
        libwebp-dev \
		libxpm-dev \
        libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libzip-dev \
		libonig-dev \
        zip \
		unzip \
		wget \
	&& docker-php-ext-install zip \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install mysqli pdo pdo_mysql mbstring iconv zip exif opcache
	
RUN echo "file_uploads = On\n" \
         "memory_limit = 500M\n" \
         "upload_max_filesize = 500M\n" \
         "post_max_size = 500M\n" \
         "max_execution_time = 600\n" \
         > /usr/local/etc/php/conf.d/uploads.ini