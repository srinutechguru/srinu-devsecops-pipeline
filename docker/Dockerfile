# Step 1: Use a modern, secure LTS base image (Node 22 Alpine)
FROM node:22-alpine

# Step 2: Update Alpine OS packages to ensure all system patches are applied
RUN apk update && apk upgrade --no-cache

# Step 3: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 4: Copy only the package files first (Optimizes Docker layer caching)
COPY src/package*.json ./

# Step 5: Install exact production dependencies securely
RUN npm install 

# Step 6: Copy the rest of the application code
COPY src/ .

# Step 7: Security Best Practice! Run as a restricted non-root user
USER node

# Step 8: Open the port the app uses
EXPOSE 3000

# Step 9: The command to run when the container starts
CMD ["npm", "start"]
