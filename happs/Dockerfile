FROM amiltimore2016/php-composer:1.0.0 

RUN mkdir -p /happs
COPY src/ happs/
COPY run.sh /happs/
COPY environments/.env /happs/.env
WORKDIR /happs
RUN chmod +x run.sh && \
    composer install --no-interaction 
     
EXPOSE 8000
    
ENTRYPOINT ["/happs/run.sh"]

