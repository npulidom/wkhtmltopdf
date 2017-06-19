wkhtmltopdf Python micro api
============================

### Requisitos de entorno

- Docker Linux, OSX.

### Usage

Replace **PORT** with container exposed port.

```
curl -X POST -vv -F 'file=@test.html' http://localhost:PORT -o test.pdf
```
