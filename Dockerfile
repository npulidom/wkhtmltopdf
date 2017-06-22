# OS
FROM alpine:3.6

# packages
RUN apk update && apk upgrade && apk add --no-cache --repository=http://dl-4.alpinelinux.org/alpine/edge/testing --allow-untrusted \
	bash \
	python \
	py-pip \
	xvfb \
	dbus \
	fontconfig \
	ttf-freefont \
	wkhtmltopdf \
	&& rm -rf /var/cache/apk/*

# pythons installs
RUN pip install \
	werkzeug \
	executor \
	gunicorn

# Wrapper for xvfb
COPY wrapper /tmp/
RUN mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin && \
		mv /tmp/wrapper /usr/bin/wkhtmltopdf && chmod +x /usr/bin/wkhtmltopdf

WORKDIR /root

# copy app
COPY app.py .
EXPOSE 80

ENTRYPOINT ["/usr/bin/gunicorn"]

#run app
CMD ["-b", "0.0.0.0:80", "--log-file", "-", "app:application"]