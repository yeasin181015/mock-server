# Use a lightweight Node.js base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the db.json file into the container
COPY db.json ./

# Expose the port json-server will run on
EXPOSE 8000

# Start json-server when the container starts
CMD ["npx", "json-server", "--watch", "db.json", "--port", "8000"]
