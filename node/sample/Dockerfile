# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set environment variable
ENV NODE_ENV=development-dockern

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Define the command to run the application
CMD ["node", "./src/server.js"]
