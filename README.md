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

### Via PowerShell
````
Invoke-RestMethod -Uri http://127.0.0.1/certcheck/<fqdn>
````

#### Example
The following example will get SSL certificate expiration for news.google.com
````
Invoke-RestMethod -Uri http://127.0.0.1/certcheck/news.google.com
````

## Example Endpoint Response
The endpoint will return data in json format with the following fields:
* URL: The url specified during the request
* Expires: Days until the certificate expires
* Date: Date the certificate will expire

### Example JSON Response
````
{   "URL": "news.google.com",   "Expires": "54",   "Date": "8/1/2022" }
````
