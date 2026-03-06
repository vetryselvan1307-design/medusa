# Use Node 18 Alpine
FROM node:18-alpine

# Enable Corepack (required for Yarn 3)
RUN corepack enable

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies using Corepack/Yarn 3
RUN yarn install

# Copy the rest of the project
COPY . .

# Expose Medusa default port
EXPOSE 9000

# Start Medusa server
CMD ["yarn", "start"]
