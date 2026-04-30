FROM node:18-alpine AS builder

WORKDIR /app
COPY src/package*.json ./
RUN npm ci --only=production

FROM node:18-alpine

RUN addgroup -S nodejs && adduser -S nodejs -G nodejs

WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY src/ ./

RUN chown -R nodejs:nodejs /app
USER nodejs

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1

EXPOSE 3000
CMD ["node", "app.js"]
