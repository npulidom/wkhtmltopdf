build:
	docker build -t vicai/wkhtmltopdf .

push:
	docker push vicai/wkhtmltopdf

.PHONY: build push
