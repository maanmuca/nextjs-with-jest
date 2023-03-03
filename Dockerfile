# Use the official Node.js 16.x LTS image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package.json yarn.lock ./

# Install the dependencies using Yarn
RUN yarn install

# Copy the source code to the container
COPY . .

# Run the tests using Jest.js
RUN yarn test

# Build the Next.js app
RUN yarn build

# Expose the default Next.js port (3000)
EXPOSE 3000

# Start the Next.js app in production mode
CMD ["yarn", "start"]