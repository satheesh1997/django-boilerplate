# django3.0.5-boilerplate

Steps to setup this code:
    1. git clone https://github.com/satheesh1997/django3.0.5-boilerplate.git
    2. cd django3.0.5-boilerplate
    3. ./setup.sh
    4. git remote set-url origin (url repos origin url)
    5. git push -u origin master

Steps to run in docker:
    1. docker build -t webapp .
    2. docker run -it -p 80:80 webapp

Note: This runs in with settings.production inside docker.
