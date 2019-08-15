FROM amiltimore2016/php-composer:1.0.0 

RUN mkdir -p /happs
COPY src/ happs/
COPY run.sh /happs/
RUN chmod +x /happs/run.sh
WORKDIR /happs
RUN composer install --no-interaction 
     
EXPOSE 8000
    
ENTRYPOINT ["/happs/run.sh"]

