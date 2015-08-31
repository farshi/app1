FROM google/nodejs
 
WORKDIR /app
ADD package.json /app/
RUN npm config set proxy http://10.44.41.228:8080
RUN npm config set https-proxy http://10.44.41.228:8080
RUN npm install
ADD . /app
 
EXPOSE 8000
CMD []
ENTRYPOINT ["/nodejs/bin/npm", "start"]
