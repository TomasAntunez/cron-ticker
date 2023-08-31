# /app
FROM node:19.2-alpine3.16 as dependencies

# cd app
WORKDIR /app

# Dest /app
COPY package.json ./

# Install dependencies
RUN npm install


# Build and test
FROM node:19.2-alpine3.16 as builder

WORKDIR /app

COPY --from=dependencies /app/node_modules ./node_modules

COPY . .

RUN npm run test


# Production dependencies
FROM node:19.2-alpine3.16 as prod-dependencies
WORKDIR /app
COPY package.json ./
RUN npm install --prod


# Execute app
FROM node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=prod-dependencies /app/node_modules ./node_modules
COPY package.json app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]
