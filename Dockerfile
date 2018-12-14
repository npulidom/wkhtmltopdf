FROM surnet/alpine-python-wkhtmltopdf:3.6.5-0.12.5-small

RUN apk update && apk add --no-cache \
  bash

RUN pip install \
	werkzeug \
	executor \
	gunicorn

WORKDIR /root

COPY app.py .

EXPOSE 80

CMD ["/usr/local/bin/gunicorn", "-b", "0.0.0.0:80", "--log-file", "-", "app:application"]
