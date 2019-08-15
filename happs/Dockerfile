FROM amiltimore2016/php-composer:1.0.0 

RUN mkdir -p /happs
COPY src/ happs/
WORKDIR /happs
RUN composer update 
     
    
#php artisan migrate --seed && \

#php artisan serve 
EXPOSE 8000
ENTRYPOINT ["tail", "-f", "/dev/null"]

