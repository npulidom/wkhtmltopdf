# wkhtmltopdf microservice

Alpine container service for [wkhtmltopdf](https://wkhtmltopdf.org/).
Uncompressed size: 230 MB.

[Github Repository](https://github.com/npulidom/wkhtmltopdf)

## Usage

Pull image

```bash
docker pull npulidom/wkhtmltopdf
```

Run the container

```bash
docker run -d -p 8080:80 npulidom/wkhtmltopdf
```

Replace **{PORT}** with container exposed port.

```bash
curl -X POST -iv -F 'file=@test.html' http://localhost:{PORT} -o test.pdf

curl -X POST -iv http://localhost:8080 -H 'Content-type: application/json' -d '{"contents":"PGh0bWw+PGJvZHk+SGVsbG8gd29ybGQhPC9ib2R5PjwvaHRtbD4="}' -o file.pdf
```

### PHP example

```php
<?php

    $html = "<html><body>Hello world!</body></html>";

    // set request body
    $body = json_encode([
        "contents" => base64_encode($html),
        "options"  => ["page-size" => "Letter"] /* remove margins using: ["B" => "0", "L" => "0", "R" => "0", "T" => "0"] */
    ]);

    // set header
    $headers = [
        "Content-Type: application/json",
        "Content-Length: ".strlen($body),
    ];

    // curl options
    $options = [
        CURLOPT_URL            => "http://wkhtmltopdf/", // the service endpoint
        CURLOPT_PORT           => 80,
        CURLOPT_POST           => 1,
        CURLOPT_POSTFIELDS     => $body,
        CURLOPT_HTTPHEADER     => $headers,
        CURLOPT_RETURNTRANSFER => true
    ];

    // curl call
    $ch = curl_init();
    curl_setopt_array($ch, $options);
    $result = curl_exec($ch);
    curl_close($ch);

    // print result
    print_r(json_decode($result, true));
?>
```
