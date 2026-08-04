# Step 1: Use a small, secure base image
FROM node:18-alpine

# Step 1.1: Update Alpine OS packages to patch vulnerabilities (like OpenSSL CVEs)
RUN apk update && apk upgrade --no-cache

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy only the package files first (This makes building faster!)
COPY src/package*.json ./

# Step 4: Install exactly what is needed for production (Security best practice)
# (Using --omit=dev clears up the npm warning from previous builds)
RUN npm install --omit=dev

# Step 5: Copy the rest of the application code
COPY src/ .

# Step 6: Security! Do not run the app as the 'root' (admin) user. Use a restricted user.
USER node

# Step 7: Open the port the app uses
EXPOSE 3000

# Step 8: The command to run when the container starts
CMD ["npm", "start"]
