#!/usr/bin/env bash

if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd /root; python manage.py createsuperuser --no-input)
fi

<< end_note
In the below line are running the server using gunicorn with
3 workers. To change the workers count use --workers <desired_count>.
The server will be running using the port 8010. To change the port
use --bind <ip_address>:<port>
end_note

(cd /root; gunicorn wsgi --user www-data --bind 0.0.0.0:8010 --workers 3) &
nginx -g "daemon off;"
