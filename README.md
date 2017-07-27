wkhtmltopdf micro api
=====================

Alpine container service for [wkhtmltopdf](https://wkhtmltopdf.org/). 
Uncompressed size: 209 MB

## Usage

Run Container
`docker run -d npulidom/img-api`
  
Replace **PORT** with container exposed port.

```
curl -X POST -vv -F 'file=@test.html' http://localhost:PORT -o test.pdf
```
   
### PHP example

```php
<?php

	$html = "<html><body>Hello world</body></html>";

	// set request body
	$body = json_encode(["contents" => base64_encode($html)]);

	// set header
	$headers = [
		"Content-Type: application/json",
		"Content-Length: ".strlen($body),
	];

	// curl options
	$options = [
		CURLOPT_URL            => http://wkhtmltopdf/,
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
