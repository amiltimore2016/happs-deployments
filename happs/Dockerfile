FROM amiltimore2016/php-composer:v1

RUN mkdir -p /happs
COPY src/ happs/
WORKDIR /happs
RUN composer update && \
    mv .env.example .env 
    
#php artisan migrate --seed && \

#php artisan serve 
EXPOSE 8000
ENTRYPOINT ["tail", "-f", "/dev/null"]
