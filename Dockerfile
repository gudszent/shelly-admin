FROM node

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app


COPY . .

# update each dependency in package.json to the latest version
RUN npm install -g npm-check-updates \
    ncu -u \
    npm install

COPY . /app
EXPOSE 43812

CMD [ "node", "./bin/www" ]

