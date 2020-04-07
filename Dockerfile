FROM python:3.8.2-slim

RUN apt-get update && apt-get install nginx vim -y --no-install-recommends

# copy nginx configuration
COPY ./deployment/nginx.default /etc/nginx/sites-available/default

# link the log files
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# copy the project
COPY . /root

WORKDIR /root

# install python requirements
RUN pip install -r requirements.txt

# run django collectstatic
RUN python manage.py collectstatic --noinput

RUN chown -R www-data:www-data /root

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["/root/deployment/start-server.sh"]
