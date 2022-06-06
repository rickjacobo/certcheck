# certcheck
certcheck is an api endpoint to retrieve SSL certificate expiration information

## Requirements
- Container Platform

## Setup
### Docker Example
* Run Docker Command
    ````
    docker run -d --name certcheck -e ENV_ROUTE=certcheck -p 80:80 rickjacobo/certcheck
    ````
## Validating Certificates
### Via Web Browser
````
http://127.0.0.1/certcheck/<fqdn>
````

#### Example
The following example will get SSL certificate expiration for news.google.com
````
http://127.0.0.1/certcheck/news.google.com
````
