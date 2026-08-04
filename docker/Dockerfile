# Step 1: Use the official secure base image
FROM node:18-alpine

# Step 2: Update Alpine OS packages and update global npm to the latest version to patch bundled dependencies (like global tar)
RUN apk update && apk upgrade --no-cache && npm install -g npm@latest

# Step 3: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 4: Copy package files
COPY src/package*.json ./

# Step 5: Install production dependencies safely
RUN npm install --omit=dev

# Step 6: Copy source code
COPY src/ .

# Step 7: Security best practice - run as non-root user
USER node

# Step 8: Expose port and start app
EXPOSE 3000
CMD ["npm", "start"]
