# Base ##################################################################
ARG BASE_IMAGE=pandoc/extra:latest
FROM $BASE_IMAGE AS base
WORKDIR /app

# Install Node.js, npm and other dependencies
RUN apk --no-cache add nodejs npm

# Copy the package.json file and install dependencies
COPY package.json /app/package.json
RUN npm install

# Copy the Node.js application
COPY app.js /app.js

# Expose port 8080
EXPOSE 8080

# Set the entry point to run the Node.js application
ENTRYPOINT ["node", "/app.js"]