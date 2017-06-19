# OS
FROM alpine:3.6

# packages
RUN apk update && apk upgrade && apk add --update --no-cache --repository=http://dl-4.alpinelinux.org/alpine/edge/testing \
		bash \
		py-pip \
		glib \
		libgcc \
		libstdc++ \
		libx11 \
		libxrender \
		libxext \
		libintl \
		libcrypto1.0 \
		libssl1.0 \
		ttf-dejavu \
		ttf-droid \
		ttf-freefont \
		ttf-liberation \
		ttf-ubuntu-font-family
		
# pythons installs
RUN pip install \
		werkzeug \
		executor \
		gunicorn
		
# download binary
RUN curl -sLo /usr/bin/wkhtmltopdf https://github.com/Civitium/docker-alpine-wkhtmltopdf/blob/master/wkhtmltopdf && chmod +x /usr/bin/wkhtmltopdf

# copy app
COPY app.py /app.py
EXPOSE 80

ENTRYPOINT ["usr/local/bin/gunicorn"]

# Show the extended help
CMD ["-b", "0.0.0.0:80", "--log-file", "-", "app:application"]