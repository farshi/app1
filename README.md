#App1

#Tutorial

```shell
$mkdir app1
$cd app1
$vim app.js
```

```javascript

// Load the http module to create an http server.
var http = require('http');

// Configure our HTTP server to respond with Hello World to all requests.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hello World");
});

// Listen on port 8000, IP defaults to "0.0.0.0"
server.listen(8000);

// Put a friendly message on the terminal
console.log("Server running at http://127.0.0.1:8000/");
```

```shell
  $vim package.json
```


```json
{
  "name": "hello-world",
  "description": "hello world",
  "version": "0.0.1",
  "private": true,
  "dependencies": {
    "express": "3.x"
  },
  "scripts": {"start": "node app.js"}
}

```
```bash
$vim Dockefile
```
```yaml
FROM google/nodejs

WORKDIR /app
ADD package.json /app/
RUN npm install
ADD . /app

EXPOSE 8000
CMD []
ENTRYPOINT ["/nodejs/bin/npm", "start"]
```
for creating and pushing the docker image to the local docker registry run this command

```shell
$ docker build -t localhost:5000/reza/nodejs_app .
$ docker push localhost:5000/reza/nodejs_app
```

if you have jenkins server you can automate building docker images for each build and push the images to your local docker registry

go to jenkins console and define these two build steps and put each of these lines to corresponding build scripts

####Script for build phase1 :
```shell
sh build.sh $BUILD_NUMBER
```

####script for build phase2:
```shell
sh push.sh $BUILD_NUMBER
```
