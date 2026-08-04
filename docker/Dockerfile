FROM node:22.23.2-alpine3.24

# Set production runtime
ENV NODE_ENV=production

# Create app directory
WORKDIR /usr/src/app

# Copy dependency manifests first for better layer caching
COPY --chown=node:node src/package*.json ./

# Install only production dependencies in a deterministic way
RUN npm ci --omit=dev --no-audit --no-fund \
    && npm cache clean --force

# Copy application source with proper ownership
COPY --chown=node:node src/ ./

# Drop privileges
USER 1000

# Application port
EXPOSE 3000

# Start app directly instead of through npm when possible
CMD ["node", "server.js"]
