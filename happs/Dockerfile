FROM amiltimore2016/php-composer:1.0.0 

USER 0
RUN mkdir -p /happs
COPY src/ happs/
COPY run.sh /happs/
COPY environments/.env /happs/.env
WORKDIR /happs
RUN chmod +x run.sh && \
    chown 1000.1000 run.sh && \
    chown -R 1000.1000 /happs 


USER 1000
RUN COMPOSER_HOME=/happs composer install --no-interaction 
     
EXPOSE 8000
    
ENTRYPOINT ["/happs/run.sh"]

