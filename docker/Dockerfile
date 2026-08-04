FROM node:22.23.2-alpine3.24

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY --chown=node:node src/package*.json ./

RUN npm ci --omit=dev --no-audit --no-fund \
    && npm cache clean --force

COPY --chown=node:node src/ ./

USER 1000

EXPOSE 3000

CMD ["node", "app/main.js"]
